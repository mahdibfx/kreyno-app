import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_radio.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'change_language_viewmodel.dart';

class ChangeLanguageView extends StackedView<ChangeLanguageViewModel> {
  const ChangeLanguageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangeLanguageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: MyAppBar(title: "Changer la langue"),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
          child: Column(
            children: [
              VGap(AppSpacing.px20),
              GestureDetector(
                onTap: () {
                  viewModel.changeLanguage('US');
                },
                child: LanguageWidget(
                  countryCode: 'US',
                  title: 'English',
                  value: viewModel.selectedLanguage == 'US',
                ),
              ),
              VGap(AppSpacing.px1 * 10),
              GestureDetector(
                onTap: () {
                  viewModel.changeLanguage('FR');
                },
                child: LanguageWidget(
                  countryCode: 'FR',
                  title: 'Français',
                  value: viewModel.selectedLanguage == 'FR',
                ),
              ),
            ],
          ),
        ));
  }

  @override
  ChangeLanguageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangeLanguageViewModel();
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget(
      {super.key,
      required this.countryCode,
      required this.title,
      this.value = false});
  final bool value;
  final String countryCode;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px1 * 14),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.strokeKre),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Flag.fromString(
            countryCode,
            height: 13.1,
            width: 20,
            fit: BoxFit.fill,
          ),
          HGap(AppSpacing.px8),
          CustomText(
            text: title,
            style: CustomTextStyle.smallParagraphBold,
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: 17 * AppSpacing.px1,
            height: 17 * AppSpacing.px1,
            decoration: BoxDecoration(
              color: value ? AppColors.greenKre : AppColors.white,
              border: Border.all(
                color: value ? AppColors.greenKre : AppColors.strokeKre,
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
            child: AnimatedOpacity(
              opacity: value ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: AppSpacing.px12,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
