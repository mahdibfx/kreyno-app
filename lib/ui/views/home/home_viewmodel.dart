import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_confirm_arrive.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_selected_mark.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_waiting_confirmation.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/seller_confirmed_for_buyer.dart';
import 'package:kreyno/ui/views/home/widgets/seller/client_canceled_order.dart';
import 'package:kreyno/ui/views/home/widgets/seller/my_marker_details.dart';
import 'package:kreyno/ui/views/home/widgets/seller/my_new_mark_label.dart';
import 'package:kreyno/ui/views/home/widgets/common/normal_home_state.dart';
import 'package:kreyno/ui/views/home/widgets/seller/received_order_widget.dart';
import 'package:kreyno/ui/views/home/widgets/seller/tracking_course_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final Set<Marker> markers = {};
  bool isThisMarkerMine = false;
  bool markSelected = false;
  bool isReceivedOrder = false;
  bool isThisAClientMark = true;
  bool showRefuseReasonForm = false;
  bool clientCanceledOrder = false;
  bool isTrackingCourse = false;
  bool clientArrived = false;
  bool clientMarkClicked = true;
  bool dropdownShown = false;
  int selectedCarId = 0;

  /// suppose this is car id
  onCarTopBarClicked() {
    dropdownShown = true;
    notifyListeners();
  }

  selectCar(int value) async {
    selectedCarId = value;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 600))
        .then((value) => markSelected = false);
    dropdownShown = false;

    notifyListeners();
  }

  hideDropdown() {
    dropdownShown = false;
    notifyListeners();
  }

  onMapClicked(LatLng position) {
    // bool isThisPositionAlreadyMarker = false; // this is when it is seller part , later it will be logically changed
    bool isThisPositionAlreadyMarker = true; // this is when it is client part
    markSelected = true;
    var searchResults = markers.where((e) =>
        e.position.longitude == position.longitude &&
        e.position.latitude == position.latitude);
    isThisPositionAlreadyMarker = searchResults.isNotEmpty;
    if (isThisPositionAlreadyMarker) {
      if (isThisMarkerMine) {
      } else {
        isThisAClientMark = true;
      }
    } else {
      markers.add(Marker(
          markerId: MarkerId(DateTime.now().microsecondsSinceEpoch.toString()),
          position: position));
    }
    notifyListeners();
  }

  chooseBottomBarBasedOnState() {
    if (true) {
      // return const BuyerWaitingConfirmation();
      // return const SellerConfirmedForBuyer();
      // return const BuyerConfirmArrive();
      const NormalHomeState();
    }
    if (markSelected && isThisAClientMark) {
      return const BuyerSelectedMark();
    }
    if (isTrackingCourse) {
      return const TrackingCourseWidget();
    }
    if (clientCanceledOrder) {
      return const ClientCanceledOrder();
    }
    if (isReceivedOrder) {
      return const ReceivedOrderWidget();
    }
    if (markSelected && isThisMarkerMine) {
      return const MyMarkerDetails();
    } else if (markSelected && !isThisMarkerMine && !isThisAClientMark) {
      return const MyNewMarkLabel();
    }

    return const NormalHomeState();
  }

  onMyMarkerDeleteClicked() {
    final showDialog = locator<DialogService>()
        .showCustomDialog(variant: DialogType.deleteSpot);
  }

  sellerClickedRefuseOrder() {
    showRefuseReasonForm = true;
    notifyListeners();
  }

  cancelRefuseOrder() {
    showRefuseReasonForm = false;
    notifyListeners();
  }
}
