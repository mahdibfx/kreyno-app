import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/drop_down_field.dart';
import 'package:stacked/stacked.dart';

import 'vehicule_type_drop_down_model.dart';

class VehiculeTypeDropDown extends StackedView<VehiculeTypeDropDownModel> {
  final Function(int) onChanged;
  const VehiculeTypeDropDown({super.key, required this.onChanged});

  @override
  Widget builder(
    BuildContext context,
    VehiculeTypeDropDownModel viewModel,
    Widget? child,
  ) {
    return DropDownField<int>(
      value: viewModel.selectedVehicleType,
      labelText: SetUpVehiculeStrings.vehiculeType,
      items: viewModel.vehicleTypeOptions.map((int vehicleType) {
        return DropdownMenuEntry<int>(
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
        );
      }).toList(),
      onChanged: (value) {
        viewModel.setSelectedVehicleType(value!);
        onChanged(value);
      },
      leadingWidget: Transform.translate(
        offset: Offset(-3 * AppSpacing.px1, 0),
        child: Transform.scale(
          scale: .8,
          alignment: Alignment.centerRight,
          child: Image.asset(
            viewModel.getVehicleTypeIcon(viewModel.selectedVehicleType),
            width: 40 * AppSpacing.px1,
          ),
        ),
      ),
    );
  }

  @override
  VehiculeTypeDropDownModel viewModelBuilder(
    BuildContext context,
  ) =>
      VehiculeTypeDropDownModel();
}
