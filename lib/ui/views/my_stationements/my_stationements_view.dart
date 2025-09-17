import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'my_stationements_viewmodel.dart';

class MyStationementsView extends StackedView<MyStationementsViewModel> {
  const MyStationementsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyStationementsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppBar(
        title: "Mes stationnements",
        actions: [
          GestureDetector(
            onTap: () {
              final d = locator<BottomSheetService>().showCustomSheet(
                  isScrollControlled: true,
                  variant: BottomSheetType.datePickerFilter);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
              child: const CustomIcon(iconPath: AppIcons.sort),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomPlacesTabbar(
              selectedIndex: viewModel.selectedIndex,
              onTabChanged: (i) {
                viewModel.changeIndex(i);
              },
            ),
          ),
          SliverToBoxAdapter(child: VGap(AppSpacing.px20)),
          SliverList.builder(
              itemCount: 10,
              itemBuilder: (c, i) => Column(
                    children: [
                      const StationementWidget(),
                      VGap(AppSpacing.px1 * 10)
                    ],
                  ))
        ],
      ),
    );
  }

  @override
  MyStationementsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyStationementsViewModel();
}

class StationementWidget extends StatelessWidget {
  const StationementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
      padding: EdgeInsets.all(AppSpacing.px12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.fromBorderSide(
              BorderSide(color: AppColors.textKre.withValues(alpha: 0.25)))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText.smallParagraphMedium(
                      "02-01-2025 · 19h00",
                      color: AppColors.textKre,
                    ),
                    VGap(AppSpacing.px1 * 5),
                    const CustomText.paragraph(
                      "Rue de la paix 8ème arrondissement, Paris, France",
                      maxLines: 2,
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.px1 * 10),
                child: Image.network(
                  "https://picsum.photos/60/60",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          VGap(AppSpacing.px12),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const CustomIcon(
                      iconPath: AppIcons.evCharging,
                      color: AppColors.greenKre,
                    ),
                    HGap(AppSpacing.px4),
                    const CustomText(
                      text: "Borne disponible",
                      style: CustomTextStyle.smallParagraphMedium,
                      color: AppColors.greenKre,
                    )
                  ],
                ),
              ),
              const CustomText.paragraph(
                "2€",
                color: AppColors.greenKre,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPlacesTabbar extends StatelessWidget {
  CustomPlacesTabbar({super.key, this.selectedIndex = 0, this.onTabChanged});
  Function(int)? onTabChanged;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
      padding: EdgeInsets.all(AppSpacing.px4),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTabChanged?.call(0);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: selectedIndex == 0 ? AppColors.white : null,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.px20,
                      vertical: AppSpacing.px1 * 10),
                  child: const CustomText.smallParagraphBold(
                    "Places réservées",
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTabChanged?.call(1);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: selectedIndex == 1 ? AppColors.white : null,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.px20,
                      vertical: AppSpacing.px1 * 10),
                  child: const CustomText.smallParagraphBold(
                    "Places cédées",
                    textAlign: TextAlign.center,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
