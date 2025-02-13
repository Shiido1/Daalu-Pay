class SendMessageEntityModel {
  num? chatId;
  num? senderId;
  String? sentFrom;
  String? message;

  SendMessageEntityModel({
    this.chatId,
    this.senderId,
    this.sentFrom,
    this.message,
  });

  factory SendMessageEntityModel.fromJson(Map<String, dynamic> json) {
    return SendMessageEntityModel(
      chatId: num.tryParse(json['chat_id'].toString()),
      senderId: num.tryParse(json['sender_id'].toString()),
      sentFrom: json['sent_from']?.toString(),
      message: json['message']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (chatId != null) 'chat_id': chatId,
        if (senderId != null) 'sender_id': senderId,
        if (sentFrom != null) 'sent_from': sentFrom,
        if (message != null) 'message': message,
      };
}
