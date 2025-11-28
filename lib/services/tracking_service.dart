import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/buyer_location_updated.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class TrackingService with ListenableServiceMixin {
  final _wsService = SocketService();
  final _authService = locator<AuthService>();
  BuyerLocationUpdated? _buyerLocationUpdated;

  BuyerLocationUpdated? get buyerLocationUpdated => _buyerLocationUpdated;
  bool get buyerArrived => _buyerLocationUpdated?.arrived ?? false;
  int fireId = DateTime.now().millisecondsSinceEpoch;
  TrackingService() {
    listenToReactiveValues([_buyerLocationUpdated, fireId]);
  }

  Future<void> listenToPlacesChange(int userId) async {
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
        event: 'parking-place.grid-updated',
        onEvent: (event) {
          try {
            // Parse the reservation
            fireId = DateTime.now().millisecondsSinceEpoch;
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

  Future<void> listenToBuyerLocation(int userId) async {
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
        onEvent: (event) {
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
