import 'package:flutter/material.dart';
import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/drop_down_field.dart';
import 'package:stacked/stacked.dart';

import 'vehicule_type_drop_down_model.dart';

class VehiculeTypeDropDown extends StackedView<VehiculeTypeDropDownModel> {
  final Function(VehicleType) onChanged;
  final bool? isRequired;
  final VehicleType? initialValue;
  const VehiculeTypeDropDown({
    super.key,
    required this.onChanged,
    this.isRequired = true,
    this.initialValue,
  });

  @override
  Widget builder(
    BuildContext context,
    VehiculeTypeDropDownModel viewModel,
    Widget? child,
  ) {
    return DropDownField<VehicleType>(
      value: viewModel.selectedVehicleType,
      labelText: SetUpVehiculeStrings.vehiculeType,
      hintText: SetUpVehiculeStrings.vehiculeTypePlaceholder,
      isRequired: isRequired,
      items: viewModel.vehicleTypeOptions.map((VehicleType vehicleType) {
        final isSelected = viewModel.selectedVehicleType == vehicleType;
        return DropdownMenuEntry<VehicleType>(
          value: vehicleType,
          label: viewModel.getVehicleTypeText(vehicleType),
          labelWidget: CustomText.smallParagraphMedium(
            viewModel.getVehicleTypeText(vehicleType),
            color: AppColors.mainKre,
          ),
          leadingIcon: Image.asset(
            viewModel.getVehicleTypeIcon(vehicleType),
            width: 40 * AppSpacing.px1,
          ),
          trailingIcon: isSelected
              ? Padding(
                  padding: EdgeInsets.only(right: AppSpacing.px4),
                  child: Icon(
                    Icons.check,
                    size: AppSpacing.px20,
                    color: AppColors.greenKre,
                  ),
                )
              : null,
        );
      }).toList(),
      onChanged: (value) {
        viewModel.setSelectedVehicleType(value);
        if (value != null) {
          onChanged(value);
        }
      },
      leadingWidget: viewModel.selectedVehicleType != null
          ? Transform.translate(
              offset: Offset(-3 * AppSpacing.px1, 0),
              child: Transform.scale(
                scale: .8,
                alignment: Alignment.centerRight,
                child: Image.asset(
                  viewModel.getVehicleTypeIcon(viewModel.selectedVehicleType!),
                  width: 40 * AppSpacing.px1,
                ),
              ),
            )
          : null,
    );
  }

  @override
  void onViewModelReady(VehiculeTypeDropDownModel viewModel) {
    if (initialValue != null) {
      viewModel.setSelectedVehicleType(initialValue);
    }
    super.onViewModelReady(viewModel);
  }

  @override
  VehiculeTypeDropDownModel viewModelBuilder(BuildContext context) =>
      VehiculeTypeDropDownModel();
}
