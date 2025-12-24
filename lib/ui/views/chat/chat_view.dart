import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/chat_message.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.reservationId,
  }) : super(key: key);
  final int id;
  final String name;
  final String image;
  final String phone;
  final int reservationId;
  @override
  Widget builder(BuildContext context, ChatViewModel viewModel, Widget? child) {
    bool online = true;
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomDivider(),
              VGap(AppSpacing.px20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                child: Row(
                  children: [
                    Expanded(
                      child: InputField(
                        controller: viewModel.messageTextController,
                        focusNode: FocusNode(),
                        hintText: "chat.newMessage".tr(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    HGap(AppSpacing.px1 * 10),
                    IconButton(
                      onPressed: () {
                        viewModel.sendMessage();
                      },
                      icon: const CustomIcon(
                        iconPath: AppIcons.send,
                        color: AppColors.greenKre,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,

            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: CustomDivider(height: 1),
            ),
            elevation: 0.3,
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            leading: GestureDetector(
              onTap: () {
                locator<NavigationService>().back();
              },
              child: const Icon(Icons.arrow_back),
            ),
            actions: const [
              // IconButton(
              //   onPressed: () {
              //     viewModel.callUser(phone);
              //   },
              //   icon: const CustomIcon(iconPath: AppIcons.call),
              // ),
            ],
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    width: AppSpacing.px1 * 40,
                    height: AppSpacing.px1 * 40,
                  ),
                ),
                HGap(AppSpacing.px8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.smallParagraphBold(name),
                    CustomText.smallParagraphMedium(
                      online ? "chat.online".tr() : "chat.offline".tr(),
                      color: online ? AppColors.greenKre : AppColors.textKre,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Column(
                children: List.generate(
                  viewModel.messages.length,
                  (i) => ChatBubble(message: viewModel.messages[i]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onDispose(ChatViewModel viewModel) {
    // TODO: implement onDispose
    super.onDispose(viewModel);
  }

  @override
  void onViewModelReady(ChatViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.init(reservationId);
  }

  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel();
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    bool isMine = message.senderId == locator<UserService>().currentUser!.id;
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isMine
                ? const Radius.circular(12)
                : const Radius.circular(4),
            bottomRight: isMine
                ? const Radius.circular(4)
                : const Radius.circular(12),
          ),
          border: isMine
              ? null
              : const Border.fromBorderSide(
                  BorderSide(color: AppColors.strokeKre),
                ),
          color: isMine ? AppColors.greenKre : const Color(0xFFFAFAFA),
        ),
        child: CustomText.smallParagraphMedium(message.body),
      ),
    );
  }
}
