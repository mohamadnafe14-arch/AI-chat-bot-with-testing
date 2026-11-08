import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/message.dart';
import '../repositories/chat_repository.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatRepository}) : super(const ChatInitial());

  final ChatRepository chatRepository;

  Future<void> sendMessage(List<Message> messages) async {
    emit(const ChatLoading());

    try {
      final response = await chatRepository.sendMessage(messages);
      emit(ChatSuccess(response));
    } catch (error) {
      emit(ChatFailure(error));
    }
  }
}
