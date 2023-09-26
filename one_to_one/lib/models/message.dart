class Message {
  Message({
    required this.toId,
    required this.msg,
    required this.read,
    required this.sent,
    required this.type,
    required this.fromId,
  });
  late final String toId;
  late final String msg;
  late final String read;
  late final String sent;
  late final Type type;
  late final String fromId;

  Message.fromJson(Map<String, dynamic> json) {
    toId = json['toId'].toString();
    msg = json['msg'].toString();
    read = json['read'].toString();
    sent = json['sent '].toString();
    type = json['type'].toString() == Type.image.name ? Type.image : Type.text;
    fromId = json['fromId'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['toId'] = toId;
    data['msg'] = msg;
    data['read'] = read;
    data['sent '] = sent;
    data['type'] = type;
    data['fromId'] = fromId;
    return data;
  }
}

enum Type { text, image }
