import 'package:flutter/cupertino.dart';
import 'package:lettutor_app/presentation/chat/services/chat_api_service.dart';

import '../models/chat_model.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> _chatList =/*
      SharedPreferencesService.getChatMessageList() ??*/ [];

  List<ChatModel> get chatList => _chatList;

  set chatList(List<ChatModel> value) {
    _chatList = value;
  }

  void addUserMessage({required String content}) {
    chatList.add(ChatModel(content: content, role: 'user'));
    notifyListeners();
  }

  void addTypingMessage() {
    ChatModel chatModel = ChatModel(
        parentMessageId: 'typing', content: "Typing...", role: 'assistant');
    chatList.add(chatModel);
    notifyListeners();
  }

  void removingTypingMessage() {
    _chatList.removeWhere((element) => element.parentMessageId == 'typing');
  }

  void clearChatHistory() {
    // SharedPreferencesService.removeChatMessageList();
    chatList.clear();
    notifyListeners();
  }

  Future<ChatModel> sendMessageAndGetAnswers() async {
    final previousMessages = chatList
        .where((element) =>
            element.role == 'user' && element.parentMessageId != 'typing')
        .map((e) => {"role": e.role, "content": e.content})
        .toList();
    final chatModel = await ChatApiService.sendMessage(messages: previousMessages);
    chatList.add(chatModel);
    removingTypingMessage();
    notifyListeners();
    // SharedPreferencesService.setChatMessageList(chatList);
    return chatModel;
  }
}