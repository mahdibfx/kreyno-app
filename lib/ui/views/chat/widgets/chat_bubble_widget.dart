import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isMine});
  final bool isMine;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMine
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: isMine
                  ? null
                  : const Border.fromBorderSide(
                      BorderSide(color: Color(0xA8A8A840)),
                    ),
              color: isMine
                  ? AppColors.greenKre
                  : AppColors.textKre.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: const Radius.circular(12),
                bottomRight: Radius.circular(isMine ? 0 : 12),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.px12,
              vertical: AppSpacing.px8,
            ),
            margin: EdgeInsets.symmetric(vertical: AppSpacing.px1 * 2),
            child: const CustomText.smallParagraphMedium("Bonjour!"),
          ),
          const CustomText.labelMedium("09:42", color: AppColors.textKre),
        ],
      ),
    );
  }
}
