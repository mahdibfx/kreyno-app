import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class AppLogo extends StatefulWidget {
  final bool animated;

  const AppLogo({Key? key, this.animated = true}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with TickerProviderStateMixin {
  late AnimationController _labelRevealController;
  late Animation<double> _labelRevealAnimation;

  @override
  void initState() {
    super.initState();

    _labelRevealController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _labelRevealAnimation = Tween<double>(
      begin: widget.animated ? 0.0 : 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _labelRevealController,
      curve: Curves.easeOutQuart,
    ));

    if (widget.animated) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          _labelRevealController.forward();
        }
      });
    } else {
      _labelRevealController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _labelRevealController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.kreynoLogoIcon,
          height: 11 * AppSpacing.px4,
        ),
        HGap(AppSpacing.px8),
        Transform.translate(
          offset: const Offset(0, 1),
          child: AnimatedBuilder(
            animation: _labelRevealAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _labelRevealAnimation.value,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: _labelRevealAnimation.value,
                    child: Image.asset(
                      AppImages.kreynoLabel,
                      height: .9 * AppSpacing.px32,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
