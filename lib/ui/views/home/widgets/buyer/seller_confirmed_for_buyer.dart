import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class SellerConfirmedForBuyer extends StatefulWidget {
  const SellerConfirmedForBuyer({super.key});

  @override
  State<SellerConfirmedForBuyer> createState() =>
      _SellerConfirmedForBuyerState();
}

class _SellerConfirmedForBuyerState extends State<SellerConfirmedForBuyer> {
  bool shown = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Column(
            children: [
              !shown
                  ? const SizedBox()
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.px12,
                        vertical: AppSpacing.px12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(
                                    0xFF339DFF,
                                  ).withValues(alpha: .3),
                                ),
                                padding: EdgeInsets.all(AppSpacing.px8),
                                child: SvgPicture.asset(
                                  AppIcons.chatRoundDots,
                                  color: const Color(0xFF339DFF),
                                ),
                              ),
                              HGap(AppSpacing.px8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.smallParagraphBold(
                                      "common.important".tr(),
                                    ),
                                    SizedBox(
                                      child: CustomText.smallParagraphMedium(
                                        "sellerConfirmedForBuyer.cancellationPolicy"
                                            .tr(),
                                        maxLines: 2,
                                        color: AppColors.textKre,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        shown = false;
                                      });
                                    },
                                    child: const CustomIcon(
                                      iconPath: AppIcons.multiplicationSign,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
