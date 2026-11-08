import '../models/message.dart';
import '../services/chat_service.dart';
import 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl({required this._chatService});

  final ChatService _chatService;

  @override
  Future<Message> sendMessage(List<Message> messages) {
    return _chatService.sendMessages(messages);
  }
}
