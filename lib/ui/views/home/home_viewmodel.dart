import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/views/home/widgets/seller/my_marker_details.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final Set<Marker> markers = {};
  bool isThisMarkerMine = true;
  onMapClicked(LatLng position) {
    bool isThisPositionAlreadyMarker = false;

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
      notifyListeners();
    }
  }

  chooseBottomBarBasedOnState() {
    if (isThisMarkerMine) {
      return const MyMarkerDetails();
    }
  }

  onMyMarkerDeleteClicked() {
    final showDialog = locator<DialogService>()
        .showCustomDialog(variant: DialogType.deleteSpot);
  }
}
