class ChatSupportModel {
  final String message;
  final String messageType;
  final int dateTime;
  final bool isSend;
  final String userName;
  final String id;

  ChatSupportModel({
    required this.message,
    required this.messageType,
    required this.dateTime,
    required this.isSend,
    required this.userName,
    required this.id,
  });
}
