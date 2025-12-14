import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';

enum CustomButtonVariant { filled, outlined, plain }

enum CustomButtonSize {
  large, // 48px
  medium, // 44px
  small, // 40px
}

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? outlineColor;
  final String? icon;
  final bool? showBadge;
  final bool isDisabled;
  final bool expandToFullWidth;
  final CustomButtonSize size;
  final double? borderRadius;
  final EdgeInsets? padding;
  final BorderSide? border;

  const CustomButton.filled({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.showBadge,
    this.isDisabled = false,
    this.expandToFullWidth = true,
    this.size = CustomButtonSize.medium,
    this.borderRadius,
    this.padding,
    this.border,
  }) : outlineColor = null,
       variant = CustomButtonVariant.filled;

  const CustomButton.outlined({
    super.key,
    required this.text,
    this.onPressed,
    this.foregroundColor,
    this.outlineColor,
    this.icon,
    this.showBadge,
    this.isDisabled = false,
    this.expandToFullWidth = true,
    this.size = CustomButtonSize.medium,
    this.borderRadius,
    this.padding,
    this.border,
  }) : backgroundColor = null,
       variant = CustomButtonVariant.outlined;

  const CustomButton.plain({
    super.key,
    required this.text,
    this.onPressed,
    this.foregroundColor,
    this.icon,
    this.showBadge,
    this.isDisabled = false,
    this.expandToFullWidth = false,
    this.size = CustomButtonSize.medium,
    this.borderRadius,
    this.padding,
  }) : backgroundColor = null,
       outlineColor = null,
       border = null,
       variant = CustomButtonVariant.plain;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final _toastService = locator<ToastService>();
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;
  bool _hasConnection = true;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
    _listenToConnectionChanges();
  }

  Future<void> _checkInitialConnection() async {
    final hasConnection =
        await InternetConnectionChecker.instance.hasConnection;
    if (mounted) {
      setState(() {
        _hasConnection = hasConnection;
      });
    }
  }

  void _listenToConnectionChanges() {
    _connectionSubscription = InternetConnectionChecker.instance.onStatusChange
        .listen((status) {
          if (mounted) {
            setState(() {
              _hasConnection = status == InternetConnectionStatus.connected;
            });
          }
        });
  }

  @override
  void dispose() {
    _connectionSubscription?.cancel();
    super.dispose();
  }

  void _handleOfflineClick() {
    _toastService.showError(
      title: ConnectivityStrings.noInternetToast,
      showIcon: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = widget.isDisabled || widget.onPressed == null;

    // For filled buttons without connection, show offline UI
    if (!_hasConnection && widget.variant == CustomButtonVariant.filled) {
      return _buildOfflineFilledButton();
    }

    // For outlined/plain buttons without connection, disable and show toast on click
    final bool effectivelyDisabled = disabled || !_hasConnection;
    final VoidCallback? effectiveOnPressed = !_hasConnection && !disabled
        ? _handleOfflineClick
        : widget.onPressed;

    return _buildButton(effectivelyDisabled, effectiveOnPressed);
  }

  Widget _buildOfflineFilledButton() {
    return FilledButton(
      onPressed: null,
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.black,
        disabledForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding:
            widget.padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: widget.border,
        fixedSize: widget.expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
      ),
      child: Text(
        ConnectivityStrings.noInternetConnection,
        style: AppTypography.smallParagraphBold.copyWith(color: Colors.white),
      ),
    );
  }

  double _getButtonHeight() {
    switch (widget.size) {
      case CustomButtonSize.large:
        return 12 * AppSpacing.px4; // 48px
      case CustomButtonSize.medium:
        return 11 * AppSpacing.px4; // 44px
      case CustomButtonSize.small:
        return 10 * AppSpacing.px4; // 40px
    }
  }

  double _getBorderRadius() {
    return widget.borderRadius ?? AppSpacing.px12;
  }

  Widget _buildButton(bool disabled, VoidCallback? onPressed) {
    switch (widget.variant) {
      case CustomButtonVariant.filled:
        return _buildFilledButton(disabled, onPressed);
      case CustomButtonVariant.outlined:
        return _buildOutlinedButton(disabled, onPressed);
      case CustomButtonVariant.plain:
        return _buildPlainButton(disabled, onPressed);
    }
  }

  Widget _buildFilledButton(bool disabled, VoidCallback? onPressed) {
    final Color buttonBackgroundColor =
        widget.backgroundColor ?? AppColors.greenKre;
    final Color buttonForegroundColor =
        widget.foregroundColor ?? AppColors.mainKre;

    return FilledButton(
      onPressed: disabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: disabled
            ? AppColors.disabledKre
            : buttonBackgroundColor,
        foregroundColor: disabled ? AppColors.textKre : buttonForegroundColor,
        disabledBackgroundColor: AppColors.disabledKre,
        disabledForegroundColor: AppColors.textKre,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding:
            widget.padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: widget.border,
        fixedSize: widget.expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
      ),
      child: _buildButtonContent(
        disabled ? AppColors.textKre : buttonForegroundColor,
      ),
    );
  }

  Widget _buildOutlinedButton(bool disabled, VoidCallback? onPressed) {
    final Color buttonForegroundColor =
        widget.foregroundColor ?? AppColors.mainKre;
    final Color buttonOutlineColor = widget.outlineColor ?? AppColors.strokeKre;

    return OutlinedButton(
      onPressed: disabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: disabled ? AppColors.textKre : buttonForegroundColor,
        disabledForegroundColor: AppColors.textKre,
        side:
            widget.border ??
            BorderSide(
              color: disabled ? AppColors.strokeKre : buttonOutlineColor,
              width: 1,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding:
            widget.padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        fixedSize: widget.expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildButtonContent(
        disabled ? AppColors.textKre : buttonForegroundColor,
      ),
    );
  }

  Widget _buildPlainButton(bool disabled, VoidCallback? onPressed) {
    final Color buttonForegroundColor =
        widget.foregroundColor ?? AppColors.greenKre;

    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: disabled ? AppColors.textKre : buttonForegroundColor,
        disabledForegroundColor: AppColors.textKre,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding:
            widget.padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        fixedSize: widget.expandToFullWidth
            ? Size(double.maxFinite, _getButtonHeight())
            : Size.fromHeight(_getButtonHeight()),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildButtonContent(
        disabled ? AppColors.textKre : buttonForegroundColor,
      ),
    );
  }

  Widget _buildButtonContent(Color forGroundColor) {
    if (widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.px8,
        children: [
          CustomIcon(
            iconPath: widget.icon!,
            size: AppSpacing.px20,
            color: forGroundColor,
          ),
          Text(
            widget.text,
            style: AppTypography.smallParagraphBold.copyWith(
              color: forGroundColor,
            ),
          ),
        ],
      );
    }

    return Badge(
      isLabelVisible: widget.showBadge ?? false,
      backgroundColor: AppColors.redKre,
      child: Text(
        widget.text,
        style: AppTypography.smallParagraphBold.copyWith(color: forGroundColor),
      ),
    );
  }
}
