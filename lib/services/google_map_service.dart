import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/models/parking_spot.dart';

class GoogleMapService {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(48.8584, 2.2945),
    zoom: 5,
  );

  Future<GoogleMapController> get futureController => _controller.future;

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void animateToCameraPosition(CameraPosition cameraPosition) {
    futureController.then((controller) async {
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    });
  }
}
