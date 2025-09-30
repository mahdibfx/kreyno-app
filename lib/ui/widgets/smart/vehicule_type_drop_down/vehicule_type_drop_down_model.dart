import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class VehiculeTypeDropDownModel extends BaseViewModel {
  VehicleType _selectedVehicleType = VehicleType.fuel;
  VehicleType get selectedVehicleType => _selectedVehicleType;

  List<VehicleType> get vehicleTypeOptions => VehicleType.values;
  void setSelectedVehicleType(VehicleType? value) {
    _selectedVehicleType = value!;
    rebuildUi();
  }

  String getVehicleTypeText(VehicleType vehicleType) {
    switch (vehicleType) {
      case VehicleType.fuel:
        return SetUpVehiculeStrings.gasVehicle;
      case VehicleType.electric:
        return SetUpVehiculeStrings.electricVehicle;
      case VehicleType.motorcycle:
        return SetUpVehiculeStrings.scooter;
    }
  }

  String getVehicleTypeIcon(VehicleType vehicleType) {
    switch (vehicleType) {
      case VehicleType.fuel:
        return AppImages.car;
      case VehicleType.electric:
        return AppImages.eCar;
      case VehicleType.motorcycle:
        return AppImages.bike;
    }
  }
}
