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
    if (messages.contains(_chatService.message)) return;
    messages.add(_chatService.message!);
    notifyListeners();
  }

  sendMessage() async {
    setBusy(true);
    final result = _chatService.sendMessage(
      reservationId,
      messageTextController.text,
    );
    messageTextController.clear();

    // result.then((result) {
    //   result.match((l) => _toastService.showError(title: l), (r) {
    //     messages.add(r);
    //     notifyListeners();
    //   });
    // });
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
