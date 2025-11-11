import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/home/widgets/common/car_top_bar.dart';
import 'package:kreyno/ui/views/home/widgets/home_bottom_bar.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NormalHomeState extends ViewModelWidget<HomeViewModel> {
  const NormalHomeState({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CarTopBar(),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RoundedButton(
                    iconPath: AppIcons.sort,
                    onPressed: () {
                      locator<BottomSheetService>().showCustomSheet(
                        variant: BottomSheetType.homeFilter,
                      );
                    },
                    shape: BoxShape.rectangle,
                  ),
                  VGap(AppSpacing.px12),
                  RoundedButton(
                    iconPath: AppIcons.gpsOn,
                    onPressed: () {},
                    shape: BoxShape.rectangle,
                  ),
                ],
              ),
            ),
            VGap(AppSpacing.px24),
            const HomeBottomBar(),
          ],
        ),
      ],
    );
  }
}
