// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  senderId: (json['sender_id'] as num).toInt(),
  body: json['body'] as String,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'body': instance.body,
      'timestamp': instance.timestamp,
    };
