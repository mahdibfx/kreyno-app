import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';

class ProfileImageCircle extends StatelessWidget {
  final String? imageUrl;
  final bool isLoading;
  const ProfileImageCircle({
    super.key,
    required this.imageUrl,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 40 * AppSpacing.px1,
          backgroundImage: CachedNetworkImageProvider(
            imageUrl ?? AppConstants.defaultAvatarUrl,
          ),
        ),
        AnimatedOpacity(
          opacity: isLoading ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Container(
            height: 80 * AppSpacing.px1,
            width: 80 * AppSpacing.px1,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: .1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomLoadingIndicator(size: 50 * AppSpacing.px1),
            ),
          ),
        ),
      ],
    );
  }
}
