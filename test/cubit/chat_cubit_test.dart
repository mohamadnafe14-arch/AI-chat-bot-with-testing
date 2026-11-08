import 'package:ai_chat_bot_with_testing/cubit/chat_cubit.dart';
import 'package:ai_chat_bot_with_testing/cubit/chat_state.dart';
import 'package:ai_chat_bot_with_testing/models/message.dart';
import 'package:ai_chat_bot_with_testing/repositories/chat_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChatCubit', () {
    test('emits loading then success after sending a message', () async {
      final response = Message.modelOutput('Hello!');
      final cubit = ChatCubit(
        chatRepository: _FakeChatRepository(result: response),
      );
      final states = expectLater(
        cubit.stream,
        emitsInOrder([isA<ChatLoading>(), isA<ChatSuccess>()]),
      );

      await cubit.sendMessage([Message.userInput('Hi')]);

      await states;
      expect(cubit.state, isA<ChatSuccess>());
      expect((cubit.state as ChatSuccess).message, response);
      await cubit.close();
    });

    test('emits loading then failure when sending fails', () async {
      final error = Exception('Request failed');
      final cubit = ChatCubit(
        chatRepository: _FakeChatRepository(error: error),
      );
      final states = expectLater(
        cubit.stream,
        emitsInOrder([isA<ChatLoading>(), isA<ChatFailure>()]),
      );

      await cubit.sendMessage([Message.userInput('Hi')]);

      await states;
      expect(cubit.state, isA<ChatFailure>());
      expect((cubit.state as ChatFailure).error, error);
      await cubit.close();
    });
  });
}

class _FakeChatRepository implements ChatRepository {
  _FakeChatRepository({this.result, this.error});

  final Message? result;
  final Object? error;

  @override
  Future<Message> sendMessage(List<Message> messages) async {
    if (error case final error?) {
      throw error;
    }

    return result!;
  }
}
