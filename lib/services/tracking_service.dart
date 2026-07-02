import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/models/buyer_location_updated.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class TrackingService with ListenableServiceMixin {
  final _wsService = SocketService();
  final _logger = Logger();
  BuyerLocationUpdated? _buyerLocationUpdated;

  BuyerLocationUpdated? get buyerLocationUpdated => _buyerLocationUpdated;
  bool get buyerArrived => _buyerLocationUpdated?.arrived ?? false;
  final List<Polyline> _buyerPlaceChangedPolylines = [];
  List<Polyline> get buyerPlaceChangedPolylines => _buyerPlaceChangedPolylines;

  /// Invoked every time a `parking-place.grid-updated` event is received on the
  /// subscribed zone channel. Listeners (e.g. the home view model and the
  /// "let my place" view model) use this to react to changes in the nearby
  /// places. The event payload is intentionally ignored.
  ///
  /// Multiple screens can be subscribed at once (e.g. Home stays alive in the
  /// background while MyLetPlace is on top), so this is a set of listeners
  /// rather than a single callback.
  final Set<void Function()> _placesChangedListeners = {};

  void addPlacesChangedListener(void Function() listener) {
    _placesChangedListeners.add(listener);
  }

  void removePlacesChangedListener(void Function() listener) {
    _placesChangedListeners.remove(listener);
  }

  void _notifyPlacesChanged() {
    for (final listener in _placesChangedListeners.toList()) {
      listener();
    }
  }

  /// Invoked when a `parking-place.deleted` event is received on the seller's
  /// `user.{id}` channel (e.g. the place expired after its time ran out). The
  /// deleted `parking_place_id` is forwarded so listeners can react only when
  /// the affected place is one they care about.
  final Set<void Function(int parkingPlaceId)> _placeDeletedListeners = {};

  void addPlaceDeletedListener(void Function(int parkingPlaceId) listener) {
    _placeDeletedListeners.add(listener);
  }

  void removePlaceDeletedListener(void Function(int parkingPlaceId) listener) {
    _placeDeletedListeners.remove(listener);
  }

  void _notifyPlaceDeleted(int parkingPlaceId) {
    for (final listener in _placeDeletedListeners.toList()) {
      listener(parkingPlaceId);
    }
  }

  TrackingService() {
    listenToReactiveValues([_buyerLocationUpdated]);
  }

  /// The zone we are currently subscribed to for grid updates.
  String? _placesChangeGeoHash;

  /// Listens for grid updates in the [geoHash] zone. Subscribing is idempotent
  /// (the socket layer replaces, never stacks, the handler), so this is safe to
  /// call on every refresh. When the zone changes we leave the previous one.
  Future<void> listenToPlacesChange(String geoHash) async {
    if (_placesChangeGeoHash != null && _placesChangeGeoHash != geoHash) {
      _wsService.leaveChannel("parking.zone.$_placesChangeGeoHash");
    }
    await _wsService.subscribePrivate(
      channel: 'parking.zone.$geoHash',
      event: 'parking-place.grid-updated',
      // A grid update happened in this zone: notify subscribers. Payload unused.
      onEvent: (_) => _notifyPlacesChanged(),
    );
    await _wsService.subscribePrivate(
      channel: 'parking.zone.$geoHash',
      event: 'parking-place.removed-from-grid',
      // A place was removed from this zone's grid: reload the same way.
      // Payload ({parking_place_id, geohash}) unused; we refresh the whole grid.
      onEvent: (_) => _notifyPlacesChanged(),
    );
    _placesChangeGeoHash = geoHash;
  }

  /// Listens for `parking-place.deleted` events on the seller's [userId]
  /// channel. Subscribing is idempotent, so this is safe to call repeatedly.
  Future<void> listenToPlaceDeleted(int userId) async {
    await _wsService.subscribePrivate(
      channel: 'user.$userId',
      event: 'parking-place.deleted',
      onEvent: (data) {
        try {
          final map = Map<String, dynamic>.from(data as Map);
          final id = map['parking_place_id'];
          if (id is int) _notifyPlaceDeleted(id);
        } catch (e, stackTrace) {
          _logger.e("[Tracking] parking-place.deleted parse error: $e");
          _logger.e(stackTrace.toString());
        }
      },
    );
  }

  Future<void> listenToBuyerLocation(int userId, LatLng spotPosition) async {
    await _wsService.subscribePrivate(
      channel: 'user.$userId',
      event: 'reservation.buyer-location.changed',
      onEvent: (data) {
        try {
          _buyerLocationUpdated = BuyerLocationUpdated.fromJson(
            Map<String, dynamic>.from(data as Map),
          );
          notifyListeners();
        } catch (e, stackTrace) {
          _logger.e("[Tracking] buyer-location parse error: $e");
          _logger.e(stackTrace.toString());
        }
      },
    );
  }
}
