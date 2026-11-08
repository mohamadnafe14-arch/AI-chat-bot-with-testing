import '../models/message.dart';

sealed class ChatState {
  const ChatState();
}

final class ChatInitial extends ChatState {
  const ChatInitial();
}

final class ChatLoading extends ChatState {
  const ChatLoading();
}

final class ChatFailure extends ChatState {
  const ChatFailure(this.error);

  final Object error;
}

final class ChatSuccess extends ChatState {
  const ChatSuccess(this.message);

  final Message message;
}
