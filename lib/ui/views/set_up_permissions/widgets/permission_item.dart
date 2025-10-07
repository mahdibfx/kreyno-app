import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

enum PermissionItemType { location, notification }

class PermissionItem extends StatelessWidget {
  final PermissionItemType type;
  final bool isGranted;
  final VoidCallback onAuthorizeTapped;

  const PermissionItem({
    super.key,
    required this.type,
    required this.isGranted,
    required this.onAuthorizeTapped,
  });

  String get iconPath {
    switch (type) {
      case PermissionItemType.location:
        return AppIcons.locationPin;
      case PermissionItemType.notification:
        return AppIcons.bell;
    }
  }

  String get title {
    switch (type) {
      case PermissionItemType.location:
        return SetUpPermissionsStrings.locationPermissionTitle;
      case PermissionItemType.notification:
        return SetUpPermissionsStrings.notificationPermissionTitle;
    }
  }

  String get description {
    switch (type) {
      case PermissionItemType.location:
        return SetUpPermissionsStrings.locationPermissionDescription;
      case PermissionItemType.notification:
        return SetUpPermissionsStrings.notificationPermissionDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppSpacing.px8,
      children: [
        Container(
          width: 40 * AppSpacing.px1,
          height: 40 * AppSpacing.px1,
          decoration: BoxDecoration(
            color: const Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(AppSpacing.px12),
          ),
          child: Center(
            child: CustomIcon(iconPath: iconPath, size: AppSpacing.px20),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2 * AppSpacing.px1,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomText.smallParagraphMedium(
                      title,
                      color: AppColors.mainKre,
                      maxLines: 4,
                    ),
                  ),
                  Flexible(
                    child: CustomText.labelMedium(
                      SetUpPermissionsStrings.authorize,
                      color: AppColors.greenKre,
                      textDecoration: TextDecoration.underline,
                      textDecorationColor: AppColors.greenKre,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              CustomText.labelMedium(description, color: AppColors.textKre),
            ],
          ),
        ),
      ],
    );
  }
}
