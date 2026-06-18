// import 'dart:async'; // needed by the commented-out places-change test helper

import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/buyer_location_updated.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class TrackingService with ListenableServiceMixin {
  final _wsService = SocketService();
  final _authService = locator<AuthService>();
  final _locationService = locator<LocationService>();
  BuyerLocationUpdated? _buyerLocationUpdated;

  BuyerLocationUpdated? get buyerLocationUpdated => _buyerLocationUpdated;
  bool get buyerArrived => _buyerLocationUpdated?.arrived ?? false;
  final List<Polyline> _buyerPlaceChangedPolylines = [];
  List<Polyline> get buyerPlaceChangedPolylines => _buyerPlaceChangedPolylines;

  /// Invoked every time a `parking-place.grid-updated` event is received on the
  /// subscribed zone channel. Listeners (e.g. the home view model) use this to
  /// refresh the nearby places. The event payload is intentionally ignored.
  void Function()? onPlacesChanged;

  TrackingService() {
    listenToReactiveValues([_buyerLocationUpdated]);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TEMPORARY TEST HELPER — emits every 10 seconds and triggers the same
  // refresh as a real `parking-place.grid-updated` event. Uncomment (along with
  // the calls in HomeViewModel) to re-test the frontend place-change behavior.
  // StreamSubscription<int>? _placesChangeTestSubscription;

  // void startPlacesChangeTest() {
  //   _placesChangeTestSubscription?.cancel();
  //   _placesChangeTestSubscription =
  //       Stream<int>.periodic(
  //         const Duration(seconds: 10),
  //         (count) => count,
  //       ).listen((tick) {
  //         Logger().i("[PlacesTest] tick #$tick -> refreshing places");
  //         onPlacesChanged?.call();
  //       });
  // }

  // void stopPlacesChangeTest() {
  //   _placesChangeTestSubscription?.cancel();
  //   _placesChangeTestSubscription = null;
  // }
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> listenToPlacesChange(String geoHash) async {
    try {
      // Check if socket is initialized
      if (!_wsService.isConnected) {
        final token = await _authService.getAccessToken();
        if (token == null) {
          return;
        }
        _wsService.initialize(authToken: token, userId: "".toString());
        // Wait a bit for connection to establish
        await Future.delayed(const Duration(seconds: 2));
        _wsService.debugStatus();
      } else {}
      // Verify echo is available after initialization
      if (!_wsService.isConnected) {
        return;
      }
      // Subscribe to the private channel

      try {
        _wsService.leaveChannel("parking.zone.$geoHash");
      } catch (e) {}
      _wsService.listenToPrivateChannel(
        channel: 'parking.zone.$geoHash',
        event: 'parking-place.grid-updated',
        onEvent: (event) {
          try {
            // A grid update happened in this zone: just refresh the places.
            // The payload is intentionally not used.
            onPlacesChanged?.call();
          } catch (e, stackTrace) {
            Logger().e("[Location] Error: $e");
          }
        },
        onError: (error) {
          Logger().e("[RESERVATION] Error: $error");
        },
      );
    } catch (e, stackTrace) {
      Logger().e("[RESERVATION] Error: $e");
    }
  }

  Future<void> listenToBuyerLocation(int userId, LatLng spotPosition) async {
    try {
      // Check if socket is initialized
      if (!_wsService.isConnected) {
        final token = await _authService.getAccessToken();
        if (token == null) {
          return;
        }
        _wsService.initialize(authToken: token, userId: userId.toString());
        // Wait a bit for connection to establish
        await Future.delayed(const Duration(seconds: 2));
        _wsService.debugStatus();
      } else {
        Logger().i("[RESERVATION] ✅ Socket already initialized and connected");
      }
      // Verify echo is available after initialization
      if (!_wsService.isConnected) {
        Logger().e(
          "[RESERVATION] ❌ CRITICAL: Echo still null after initialization!",
        );
        Logger().e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        return;
      }
      // Subscribe to the private channel
      _wsService.listenToPrivateChannel(
        channel: 'user.$userId',
        event: 'reservation.buyer-location.changed',
        onEvent: (event) async {
          try {
            // Parse the reservation

            final buyerLocationUpdated = BuyerLocationUpdated.fromJson(event);
            _buyerLocationUpdated = buyerLocationUpdated;

            notifyListeners();
          } catch (e, stackTrace) {
            Logger().e("[Location] Error: $e");
          }
        },
        onError: (error) {
          Logger().e("[RESERVATION] Error: $error");
        },
      );
    } catch (e, stackTrace) {
      Logger().e("[RESERVATION] Error: $e");
    }
  }
}
