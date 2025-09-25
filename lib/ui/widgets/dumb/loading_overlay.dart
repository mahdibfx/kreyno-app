import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';

class LoadingOverlay extends StatefulWidget {
  final bool isShown;
  final Widget child;
  const LoadingOverlay({super.key, required this.isShown, required this.child});

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  final OverlayPortalController controller = OverlayPortalController();
  static const _animationDuration = Duration(milliseconds: 600);
  static const _animationCurve = Curves.fastLinearToSlowEaseIn;
  bool _isShown = false;

  @override
  void initState() {
    _animateWidgets();
    super.initState();
  }

  void _animateWidgets() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isShown) controller.show();
      await Future.delayed(const Duration(milliseconds: 130), () {
        setState(() {
          _isShown = widget.isShown;
        });
      });
      if (!widget.isShown) controller.hide();
    });
  }

  @override
  void didUpdateWidget(covariant LoadingOverlay oldWidget) {
    _animateWidgets();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: controller,
      overlayChildBuilder: (context) => IgnorePointer(
        ignoring: !widget.isShown,
        child: RepaintBoundary(
          child: AnimatedOpacity(
            duration: _animationDuration,
            curve: _animationCurve,
            opacity: _isShown ? 1.0 : .0,
            child: Container(
              width: 100.dw,
              height: 100.dh,
              color: AppColors.white.withValues(alpha: .8),
              child: Center(
                child: CustomLoadingIndicator(size: 64 * AppSpacing.px1),
              ),
            ),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
