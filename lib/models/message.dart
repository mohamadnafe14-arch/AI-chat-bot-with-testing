enum MessageType {
  userInput('user_input'),
  modelOutput('model_output');

  const MessageType(this.value);

  final String value;

  static MessageType fromValue(String value) {
    return MessageType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw FormatException('Unknown message type: $value'),
    );
  }
}

enum MessageContentType {
  text('text');

  const MessageContentType(this.value);

  final String value;

  static MessageContentType fromValue(String value) {
    return MessageContentType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw FormatException('Unknown message content type: $value'),
    );
  }
}

class MessageContent {
  const MessageContent({required this.type, required this.text});

  const MessageContent.text(String text)
    : this(type: MessageContentType.text, text: text);

  final MessageContentType type;
  final String text;

  factory MessageContent.fromJson(Map<String, dynamic> json) {
    return MessageContent(
      type: MessageContentType.fromValue(json['type'] as String),
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'type': type.value, 'text': text};
}

class Message {
  const Message({required this.type, required this.content});

  factory Message.userInput(String text) {
    return Message(
      type: MessageType.userInput,
      content: [MessageContent.text(text)],
    );
  }

  factory Message.modelOutput(String text) {
    return Message(
      type: MessageType.modelOutput,
      content: [MessageContent.text(text)],
    );
  }

  final MessageType type;
  final List<MessageContent> content;

  factory Message.fromJson(Map<String, dynamic> json) {
    final content = json['content'] as List<dynamic>;

    return Message(
      type: MessageType.fromValue(json['type'] as String),
      content: content
          .map((item) => MessageContent.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type.value,
    'content': content.map((item) => item.toJson()).toList(),
  };
}
