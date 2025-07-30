import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/widgets/dumb/app_logo.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.mainKre,
      body: SizedBox(
        height: 100.dh,
        width: 100.dw,
        child: Stack(
          children: [
            Opacity(
              opacity: .95,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.background),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: .7,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, .8],
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 50.dh,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 1],
                  colors: [
                    AppColors.mainKre,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppSpacing.px8,
                children: [
                  const AppLogo(
                    animated: false,
                  ),
                  CustomText.smallParagraphMedium(
                    'Le futur du stationnement',
                    color: AppColors.white.withValues(alpha: .7),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 27.dh,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, .5],
                    colors: [
                      AppColors.mainKre.withValues(alpha: .0),
                      AppColors.mainKre,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(
                      AppSpacing.px24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: AppSpacing.px16,
                      children: [
                        CustomButton.filled(
                          text: 'Continuer avec numéro',
                          icon: AppIcons.call,
                          size: CustomButtonSize.large,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
