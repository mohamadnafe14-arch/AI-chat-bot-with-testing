import 'package:ai_chat_bot_with_testing/models/message.dart';
import 'package:ai_chat_bot_with_testing/services/api_client.dart';
import 'package:ai_chat_bot_with_testing/services/chat_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Message', () {
    test('serializes to the interactions input format', () {
      expect(Message.userInput('What is my name?').toJson(), {
        'type': 'user_input',
        'content': [
          {'type': 'text', 'text': 'What is my name?'},
        ],
      });
    });

    test('parses a model output message', () {
      final message = Message.fromJson({
        'type': 'model_output',
        'content': [
          {'type': 'text', 'text': 'Your name is Mohamed.'},
        ],
      });

      expect(message.type, MessageType.modelOutput);
      expect(message.content.single.text, 'Your name is Mohamed.');
    });
  });

  group('ChatService', () {
    test('posts history and returns the model output step', () async {
      final apiClient = _FakeApiClient({
        'steps': [
          {'type': 'thought'},
          {
            'type': 'model_output',
            'content': [
              {'type': 'text', 'text': 'Your name is Mohamed.'},
            ],
          },
        ],
      });
      final service = ChatService(apiKey: 'test-key', apiClient: apiClient);
      final messages = [
        Message.userInput('My name is Mohamed'),
        Message.modelOutput('Hello Mohamed! Nice to meet you.'),
        Message.userInput('What is my name?'),
      ];

      final result = await service.sendMessages(messages);

      expect(result.type, MessageType.modelOutput);
      expect(result.content.single.text, 'Your name is Mohamed.');
      expect(
        apiClient.path,
        'https://generativelanguage.googleapis.com/v1beta/interactions',
      );
      expect(apiClient.data, {
        'model': 'gemini-3.8-flash',
        'input': messages.map((message) => message.toJson()).toList(),
      });
      expect(apiClient.options?.headers?['x-goog-api-key'], 'test-key');
      expect(apiClient.options?.headers?['Api-Revision'], '2026-05-20');
    });

    test('throws when Gemini response has no model output', () async {
      final service = ChatService(
        apiKey: 'test-key',
        apiClient: _FakeApiClient({'steps': []}),
      );

      expect(
        () => service.sendMessages([Message.userInput('Hello')]),
        throwsFormatException,
      );
    });
  });
}

class _FakeApiClient implements ApiClient {
  _FakeApiClient(this.responseData);

  final dynamic responseData;
  String? path;
  Object? data;
  Options? options;

  @override
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    this.path = path;
    this.data = data;
    this.options = options;

    return Response<T>(
      requestOptions: RequestOptions(path: path),
      data: responseData as T,
    );
  }
}
