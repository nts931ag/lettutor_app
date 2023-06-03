import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String content;
  final String role;
  final String? parentMessageId;

  ChatModel({required this.content, required this.role, this.parentMessageId});

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      ChatModel(
          content: json["content"],
          role: json["role"],
          parentMessageId: json["parentMessageId"]);

  static Map<String, dynamic> toMap(ChatModel chatModel) =>
      {
        'content': chatModel.content,
        'role': chatModel.role,
        'parentMessageId': chatModel.parentMessageId,
      };

  static String encode(List<ChatModel> chatModels) =>
      json.encode(
        chatModels
            .map<Map<String, dynamic>>(
                (chatModel) => ChatModel.toMap(chatModel))
            .toList(),
      );

  static List<ChatModel> decode(String chatModels) =>
      (json.decode(chatModels) as List<dynamic>)
          .map<ChatModel>((item) => ChatModel.fromJson(item))
          .toList();

  @override
  List<Object?> get props => [content, role, parentMessageId];
}
