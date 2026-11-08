import '../models/message.dart';

abstract interface class ChatRepository {
  Future<Message> sendMessage(List<Message> messages);
}
