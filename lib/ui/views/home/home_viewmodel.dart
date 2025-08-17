import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/views/home/widgets/seller/client_canceled_order.dart';
import 'package:kreyno/ui/views/home/widgets/seller/my_marker_details.dart';
import 'package:kreyno/ui/views/home/widgets/seller/my_new_mark_label.dart';
import 'package:kreyno/ui/views/home/widgets/seller/normal_home_state.dart';
import 'package:kreyno/ui/views/home/widgets/seller/received_order_widget.dart';
import 'package:kreyno/ui/views/home/widgets/seller/tracking_course_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final Set<Marker> markers = {};
  bool isThisMarkerMine = false;
  bool markSelected = false;
  bool isReceivedOrder = true;
  bool isThisAClientMark = false;
  bool showRefuseReasonForm = false;
  bool clientCanceledOrder = false;
  bool isTrackingCourse = true;
  bool clientArrived = true;
  onMapClicked(LatLng position) {
    bool isThisPositionAlreadyMarker = false;
    markSelected = true;
    var searchResults = markers.where((e) =>
        e.position.longitude == position.longitude &&
        e.position.latitude == position.latitude);
    isThisPositionAlreadyMarker = searchResults.isNotEmpty;
    if (isThisPositionAlreadyMarker) {
      if (isThisMarkerMine) {}
    } else {
      markers.add(Marker(
          markerId: MarkerId(DateTime.now().microsecondsSinceEpoch.toString()),
          position: position));
    }
    notifyListeners();
  }

  chooseBottomBarBasedOnState() {
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
