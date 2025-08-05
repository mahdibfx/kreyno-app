import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class VehiculeTypeDropDownModel extends BaseViewModel {
  int _selectedVehicleType = 1;
  int get selectedVehicleType => _selectedVehicleType;

  List<int> get vehicleTypeOptions => [
        1,
        2,
        3,
      ];
  void setSelectedVehicleType(int? value) {
    _selectedVehicleType = value!;
    rebuildUi();
  }

  String getVehicleTypeText(int vehicleType) {
    switch (vehicleType) {
      case 1:
        return SetUpVehiculeStrings.gasVehicle;
      case 2:
        return SetUpVehiculeStrings.electricVehicle;
      case 3:
        return SetUpVehiculeStrings.scooter;
      default:
        return SetUpVehiculeStrings.gasVehicle;
    }
  }

  String getVehicleTypeIcon(int vehicleType) {
    switch (vehicleType) {
      case 1:
        return AppImages.car;
      case 2:
        return AppImages.eCar;
      case 3:
        return AppImages.bike;
      default:
        return AppImages.car;
    }
  }
}
