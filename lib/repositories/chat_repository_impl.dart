import '../models/message.dart';
import '../services/chat_service.dart';
import 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl({required this.chatService});

  final ChatService chatService;

  @override
  Future<Message> sendMessage(List<Message> messages) {
    return chatService.sendMessages(messages);
  }
}
