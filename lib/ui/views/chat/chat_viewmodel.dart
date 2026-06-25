import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/chat_message.dart';
import 'package:kreyno/services/chat_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/url_launcher_service.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends ReactiveViewModel {
  final _chatService = locator<ChatService>();
  final _toastService = locator<ToastService>();
  final _urlLauncher = locator<UrlLauncherService>();
  final messageTextController = TextEditingController();
  final messages = <ChatMessage>[];
  final messageFocusNode = FocusNode();
  callUser(String phone) async {
    final result = await _urlLauncher.launchPhoneNumber(phone);
  }

  late int reservationId;
  init(int kReservationId) {
    reservationId = kReservationId;
    getChatHistory();
    // if (_chatService.listenersCount == 1) {
    _chatService.listenToMessageReceiver(reservationId);
    // }

    _chatService.removeListener(_onMessageReceived);
    _chatService.addListener(_onMessageReceived);
  }

  void _onMessageReceived() {
    final message = _chatService.message;
    if (message == null) return;
    // The server echoes the sender's own message with the same canonical
    // fields we already appended from the send response, so value-equality
    // dedup keeps it from being added twice.
    if (messages.contains(message)) return;
    messages.add(message);
    notifyListeners();
  }

  sendMessage() async {
    final text = messageTextController.text.trim();
    if (text.isEmpty) return;
    setBusy(true);
    messageFocusNode.unfocus();

    final result = await _chatService.sendMessage(reservationId, text);
    result.match(
      // Keep the typed text so the user can retry on failure.
      (error) => _toastService.showError(title: error),
      (message) {
        messageTextController.clear();
        if (!messages.contains(message)) {
          messages.add(message);
          notifyListeners();
        }
      },
    );
    setBusy(false);
  }

  getChatHistory() async {
    final result = await _chatService.getChatHistory(reservationId);
    result.match((l) => _toastService.showError(title: l), (result) {
      messages.addAll(result);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _chatService.removeListener(_onMessageReceived);
    super.dispose();
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [_chatService];
}
