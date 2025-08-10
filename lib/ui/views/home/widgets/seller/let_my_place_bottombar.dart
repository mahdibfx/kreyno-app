import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked_services/stacked_services.dart';

class LetMyPlaceBottombar extends StatelessWidget {
  const LetMyPlaceBottombar({super.key, this.isButtonDisabled});
  final bool? isButtonDisabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px20,
        vertical: AppSpacing.px20,
      ),
      child: Row(
        children: [
          Expanded(
              child: CustomButton.filled(
            text: "Céder ma place",
            onPressed: isButtonDisabled == true && isButtonDisabled != null
                ? null
                : () async {
                    await locator<BottomSheetService>().showCustomSheet(
                        variant: BottomSheetType.createSpot,
                        enableDrag: false,
                        barrierDismissible: false);
                  },
          )),
          SizedBox(width: AppSpacing.px8),
          Container(
            width: 11 * AppSpacing.px4,
            height: 11 * AppSpacing.px4,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/100/100")),
              borderRadius: BorderRadius.circular(12),
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
