import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/chat/widgets/chat_bubble_widget.dart';
import 'package:kreyno/ui/views/chat/widgets/enter_message_section.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const EnterMessageSection(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // elevation: 20,
        bottom: const PreferredSize(
            preferredSize: Size(0, 1), child: CustomDivider()),
        leading: IconButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: const CustomIcon(iconPath: AppIcons.phone)),
          )
        ],
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://picsum.photos/400/400",
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              width: AppSpacing.px8,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.smallParagraphBold("sarah.dupons92"),
                CustomText.labelMedium(
                  "en ligne",
                  color: AppColors.greenKre,
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
        child: Column(
          children: [
            SizedBox(
              height: AppSpacing.px24,
            ),
            const CustomText(
              text: "Aujourd’hui",
              style: CustomTextStyle.labelMedium,
              color: AppColors.textKre,
            ),
            const ChatBubble(isMine: true),
            const ChatBubble(isMine: false)
          ],
        ),
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();
}
