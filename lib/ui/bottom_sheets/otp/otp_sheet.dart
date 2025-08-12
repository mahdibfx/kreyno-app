import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/otp_field.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'otp_sheet_model.dart';

class OtpSheet extends StackedView<OtpSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const OtpSheet({Key? key, required this.completer, required this.request})
    : super(key: key);

  @override
  Widget builder(BuildContext context, OtpSheetModel viewModel, Widget? child) {
    return BottomSheetLayout(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: AppSpacing.px20,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: AppSpacing.px4,
                  children: [
                    CustomText.largeTitle(
                      OtpStrings.title,
                      color: AppColors.mainKre,
                    ),
                    CustomText.smallParagraphMedium(
                      OtpStrings.description,
                      color: AppColors.textKre,
                      maxLines: 2,
                    ),
                  ],
                ),
                OtpField(
                  onComplete: (value) {
                    completer?.call(
                      SheetResponse(confirmed: true, data: value),
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: AppSpacing.px4,
                    children: [
                      CustomText.smallParagraphMedium(
                        OtpStrings.codeNotReceived,
                        color: AppColors.textKre,
                      ),
                      viewModel.canResendCode
                          ? GestureDetector(
                              onTap: viewModel.resendCode,
                              child: CustomText.smallParagraphBold(
                                OtpStrings.resendCode,
                                color: AppColors.greenKre,
                                textDecoration: TextDecoration.underline,
                                textDecorationColor: AppColors.greenKre,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              spacing: AppSpacing.px4,
                              children: [
                                CustomText.paragraph(
                                  OtpStrings.resendCodeIn,
                                  color: AppColors.mainKre,
                                ),
                                CustomText.paragraph(
                                  '${viewModel.remainingTime}s',
                                  color: AppColors.mainKre,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px12),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(OtpSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.startTimer();
  }

  @override
  OtpSheetModel viewModelBuilder(BuildContext context) => OtpSheetModel();
}
