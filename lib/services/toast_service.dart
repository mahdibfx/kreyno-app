import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/widgets/dumb/custom_toast.dart';
import 'package:toastification/toastification.dart';

enum ToastType { success, error, warning, info }

class ToastService {
  static const Duration _defaultDuration = Duration(seconds: 4);

  void showSuccess({
    required String title,
    String? description,
    Duration? duration,
    Alignment? alignment,
    bool showIcon = false,
  }) {
    _showCustomToast(
      title: title,
      description: description,
      type: ToastType.success,
      duration: duration ?? _defaultDuration,
      alignment: alignment ?? Alignment.topCenter,
      showIcon: showIcon,
    );
  }

  void showError({
    required String title,
    String? description,
    Duration? duration,
    Alignment? alignment,
    bool showIcon = false,
  }) {
    _showCustomToast(
      title: title,
      description: description,
      type: ToastType.error,
      duration: duration ?? _defaultDuration,
      alignment: alignment ?? Alignment.topCenter,
      showIcon: showIcon,
    );
  }

  void showWarning({
    required String title,
    String? description,
    Duration? duration,
    Alignment? alignment,
    bool showIcon = false,
  }) {
    _showCustomToast(
      title: title,
      description: description,
      type: ToastType.warning,
      duration: duration ?? _defaultDuration,
      alignment: alignment ?? Alignment.topCenter,
      showIcon: showIcon,
    );
  }

  void showInfo({
    required String title,
    String? description,
    Duration? duration,
    Alignment? alignment,
    bool showIcon = false,
  }) {
    _showCustomToast(
      title: title,
      description: description,
      type: ToastType.info,
      duration: duration ?? _defaultDuration,
      alignment: alignment ?? Alignment.topCenter,
      showIcon: showIcon,
    );
  }

  void _showCustomToast({
    required String title,
    String? description,
    required ToastType type,
    required Duration duration,
    required Alignment alignment,
    bool showIcon = false,
  }) {
    final config = _getToastConfig(type, showIcon: showIcon);

    toastification.showCustom(
      autoCloseDuration: duration,
      alignment: alignment,
      callbacks: ToastificationCallbacks(
        onDismissed: (item) {
          toastification.dismiss(item);
        },
      ),
      dismissDirection: DismissDirection.up,
      builder: (context, item) => CustomToast(
        title: title,
        description: description,
        config: config,
        duration: duration,
      ),
    );
  }

  ToastConfig _getToastConfig(ToastType type, {bool showIcon = false}) {
    switch (type) {
      case ToastType.success:
        return ToastConfig(
          backgroundColor: AppColors.backgroundSuccess,
          borderColor: AppColors.borderSuccess,
          iconPath: showIcon ? AppIcons.checkmarkCircle : null,
          iconColor: showIcon ? AppColors.textSuccess : null,
          titleColor: AppColors.textSuccess,
          descriptionColor: AppColors.textSuccessSecondary,
        );
      case ToastType.error:
        return ToastConfig(
          backgroundColor: AppColors.backgroundError,
          borderColor: AppColors.borderError,
          iconPath: showIcon ? AppIcons.closeCircle : null,
          iconColor: showIcon ? AppColors.textError : null,
          titleColor: AppColors.textError,
          descriptionColor: AppColors.textErrorSecondary,
        );
      case ToastType.warning:
        return ToastConfig(
          backgroundColor: AppColors.backgroundWarning,
          borderColor: AppColors.borderWarning,
          iconPath: showIcon ? AppIcons.alert : null,
          iconColor: showIcon ? AppColors.textWarning : null,
          titleColor: AppColors.textWarning,
          descriptionColor: AppColors.textWarningSecondary,
        );
      case ToastType.info:
        return ToastConfig(
          backgroundColor: AppColors.backgroundInfo,
          borderColor: AppColors.borderInfo,
          iconPath: showIcon ? AppIcons.info : null,
          iconColor: showIcon ? AppColors.textInfo : null,
          titleColor: AppColors.textInfo,
          descriptionColor: AppColors.textInfoSecondary,
        );
    }
  }
}
