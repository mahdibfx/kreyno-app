import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/models/buyer_location_updated.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/chat_service.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/tracking_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/views/home/home_view.dart';
import 'package:kreyno/ui/views/spot_sold_success/spot_sold_success_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClientTrackingViewModel extends ReactiveViewModel {
  final _trackingService = locator<TrackingService>();
  final _userService = locator<UserService>();
  final _reservationsService = locator<ReservationsService>();
  final _navigationService = locator<NavigationService>();
  final _toastService = locator<ToastService>();
  final _locationService = locator<LocationService>();
  final _chatService = locator<ChatService>();

  get userId => _userService.currentUser?.id;
  List<Polyline> get polyLines => _trackingService.buyerPlaceChangedPolylines;
  BuyerLocationUpdated? get buyerLocation =>
      _trackingService.buyerLocationUpdated;
  bool get buyerArrived =>
      _trackingService.buyerLocationUpdated?.arrived ?? false;
  bool cancelButtonDisabled = true;
  String remainingTime = "01:00";
  int remainingSeconds = 0;
  int seconds = 0;
  int unreadMessagesCount = 0;
  Timer? _timer;
  Reservation? reservation;

  String get distanceToSpot {
    final currentLocation = _locationService.currentLocation;
    if (currentLocation == null || reservation == null) return "0 km";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      reservation!.parkingPlace.latitude,
      reservation!.parkingPlace.longitude,
    );
    return "${(distanceInMeters / 1000).toStringAsFixed(1)} km";
  }

  goToChat() {
    _navigationService.navigateToChatView(
      reservationId: reservation!.id,
      id: reservation!.id,
      name: reservation!.buyer.username,
      image: reservation!.buyer.avatar?.url ?? AppConstants.defaultAvatarUrl,
      phone: reservation!.buyer.phone,
    );
  }

  String formatSecondsToMMSS(int totalSeconds) {
    final minutes = totalSeconds ~/ 60; // integer division
    final seconds = totalSeconds % 60;

    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  void _setupChatListener() {
    _chatService.removeListener(_onChatMessageReceived);
    _chatService.listenToMessageReceiver(reservation!.id);
    _chatService.addListener(_onChatMessageReceived);
  }

  void _onChatMessageReceived() {
    if (_chatService.message!.senderId ==
        locator<UserService>().currentUser!.id) {
      unreadMessagesCount = 0;
      notifyListeners();
      return;
    }
    unreadMessagesCount = _chatService.message != null ? 1 : 0;
    notifyListeners();
  }

  void _setupReservationListener() {
    _reservationsService.removeListener(_onReservationStatusChanged);
    _reservationsService.listenToReservationStatusChanged(
      locator<UserService>().currentUser!.id,
    );
    _reservationsService.addListener(_onReservationStatusChanged);
  }

  void _cleanupAndNavigateHome() {
    _cleanupListeners();
    _navigationService.back();
    _navigationService.back();
  }

  void _cleanupListeners() {
    _chatService.removeListener(_onChatMessageReceived);
    _reservationsService.removeListener(_onReservationStatusChanged);
    _reservationsService.removeReservation();
    // if (reservation?.id != null) {
    //   _reservationsService.stopListeningToReservationUpdates(reservation!.id);
    // }
  }

  void _onReservationStatusChanged() {
    if (_reservationsService.reservation?.status ==
        ReservationStatus.canceled) {
      print("fumed here");
      _toastService.showError(title: "clientCanceledOrder.title".tr());
      _cleanupAndNavigateHome();
    }
  }

  void initialise(Reservation kReservation) {
    reservation = kReservation;
    seconds = 1 * 60;
    remainingSeconds = seconds - 1;

    _trackingService.listenToBuyerLocation(
      userId,
      LatLng(
        reservation!.parkingPlace.latitude,
        reservation!.parkingPlace.longitude,
      ),
    );
    _setupChatListener();
    _setupReservationListener();

    _timer?.cancel(); // Cancel any existing timer
    Timer(Duration(seconds: seconds), () {
      cancelButtonDisabled = false;

      _timer?.cancel();
      notifyListeners();
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingSeconds--;
      remainingTime = formatSecondsToMMSS(remainingSeconds);
      rebuildUi();
    });
  }

  Future<void> completeReservation() async {
    // _navigationService.navigateToSpotSoldSuccessView(reservation: reservation!);
    // return;
    final result = await _reservationsService.completeReservation(
      reservation!.id,
    );

    result.match((l) => _toastService.showError(title: l), (r) {
      _navigationService.clearStackAndShowView(
        SpotSoldSuccessView(reservation: reservation!),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cleanupListeners();
    super.dispose();
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [
    _trackingService,
    _chatService,
  ];
}
