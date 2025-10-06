import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class CustomToast extends StatefulWidget {
  final String title;
  final String? description;
  final ToastConfig config;
  final Duration? duration;
  final bool showProgressBar;

  const CustomToast({
    super.key,
    required this.title,
    this.description,
    required this.config,
    this.duration,
    this.showProgressBar = true,
  });

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.showProgressBar && widget.duration != null) {
      _progressController = AnimationController(
        duration: widget.duration!,
        vsync: this,
      );

      _progressAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _progressController, curve: Curves.linear),
      );

      _progressController.forward();
    }
  }

  @override
  void dispose() {
    if (widget.showProgressBar && widget.duration != null) {
      _progressController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            padding: EdgeInsets.all(AppSpacing.px16),
            decoration: BoxDecoration(
              color: widget.config.backgroundColor,
              borderRadius: BorderRadius.circular(AppSpacing.px12),
            ),
            child: Row(
              children: [
                if (widget.config.iconPath != null) ...[
                  CustomIcon(
                    iconPath: widget.config.iconPath!,
                    size: AppSpacing.px32,
                    color: widget.config.iconColor!,
                  ),
                  HGap(AppSpacing.px12),
                ],
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.smallParagraphBold(
                        widget.title,
                        maxLines: 6,
                        color: widget.config.titleColor,
                      ),
                      if (widget.description != null) ...[
                        VGap(AppSpacing.px4),
                        CustomText.labelRegular(
                          widget.description!,
                          maxLines: 6,
                          color: widget.config.descriptionColor,
                        ),
                      ],
                      VGap(6 * AppSpacing.px1),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (widget.showProgressBar && widget.duration != null)
            _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Positioned(
      left: AppSpacing.px16,
      right: AppSpacing.px16,
      bottom: AppSpacing.px1,
      child: AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4 * AppSpacing.px1),
            height: AppSpacing.px4,
            decoration: BoxDecoration(
              color: widget.config.borderColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSpacing.px12),
                bottomRight: Radius.circular(AppSpacing.px12),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: _progressAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.config.borderColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSpacing.px16),
                      topRight: Radius.circular(AppSpacing.px12),
                      bottomRight: Radius.circular(AppSpacing.px12),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ToastConfig {
  final Color backgroundColor;
  final Color borderColor;
  final String? iconPath;
  final Color? iconColor;
  final Color titleColor;
  final Color descriptionColor;

  const ToastConfig({
    required this.backgroundColor,
    required this.borderColor,
    this.iconPath,
    this.iconColor,
    required this.titleColor,
    required this.descriptionColor,
  });
}
