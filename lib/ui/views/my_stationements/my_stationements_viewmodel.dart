import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/parking_place.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/parking_places_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:stacked/stacked.dart';

class MyStationementsViewModel extends BaseViewModel {
  final _parkingPlacesService = locator<ParkingPlacesService>();
  List<ParkingPlace> myPlaces = [];
  List<ParkingPlace> myGivenUpPlaces = [];
  int selectedIndex = 0;
  getUserParkingPlaces() async {
    setBusy(true);
    try {
      final result = await _parkingPlacesService.getUserParkingPlaces();
      if (result.success) {
        myPlaces.addAll(result.data);
      } else {
// handle backend errors
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        //TO:DO this for internet error screen , i saw fateh did some specific error screens
      }
    } catch (e) {
      //TO:DO this for generalized error screen
    }

    setBusy(false);
  }

  getUserGivenUpParkingPlaces() async {
    setBusy(true);
    try {
      final result = await _parkingPlacesService.getUserGivenUpParkingPlaces();
      if (result.success) {
        myGivenUpPlaces.addAll(result.data);
      } else {
// handle backend errors
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        //TO:DO this for internet error screen , i saw fateh did some specific error screens
      }
    } catch (e) {
      //TO:DO this for generalized error screen
    }

    setBusy(false);
  }

  changeIndex(int i) {
    if (i == selectedIndex) return;
    selectedIndex = i;
    if (selectedIndex == 0 && myPlaces.isEmpty) {
      getUserParkingPlaces();
    }
    if (selectedIndex == 1 && myGivenUpPlaces.isEmpty) {
      getUserGivenUpParkingPlaces();
    }
    notifyListeners();
  }

  init() {
    getUserParkingPlaces();
  }
}
