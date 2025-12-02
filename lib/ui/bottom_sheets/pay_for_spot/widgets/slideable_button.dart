import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class SlideableButton extends StatefulWidget {
  const SlideableButton({super.key, required this.onCompleted, this.label});

  final VoidCallback onCompleted;
  final String? label;

  @override
  State<SlideableButton> createState() => _SlideableButtonState();
}

class _SlideableButtonState extends State<SlideableButton> {
  double dragX = 0;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width * 0.85;
    const knobSize = 52.0;
    final maxDrag = totalWidth - knobSize;

    return Container(
      width: totalWidth,
      height: 58,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.greenKre,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Background progress fill
          AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            width: dragX + knobSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Center text
          Center(
            child: AnimatedOpacity(
              opacity: (1 - (dragX / maxDrag)).clamp(0.0, 1.0),
              duration: const Duration(milliseconds: 100),
              child: CustomText(
                text: widget.label ?? "slideableButton.slideToPay".tr(),
                color: AppColors.mainKre,
              ),
            ),
          ),

          // Draggable knob
          Positioned(
            left: dragX,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  dragX += details.delta.dx;
                  dragX = dragX.clamp(0, maxDrag);
                });
              },
              onHorizontalDragEnd: (details) {
                if (dragX >= maxDrag * 0.9 && !isCompleted) {
                  // Fully slided
                  isCompleted = true;
                  widget.onCompleted();
                } else {
                  // Reset
                  setState(() => dragX = 0);
                }
              },
              child: Container(
                width: knobSize,
                height: knobSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: CustomIcon(
                    iconPath: AppIcons.doubleAltArrowRight,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
