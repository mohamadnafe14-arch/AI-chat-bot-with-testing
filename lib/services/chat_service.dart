import 'package:dio/dio.dart';

import '../models/message.dart';
import 'api_client.dart';

class ChatService {
  ChatService({
    required this.apiKey,
    ApiClient? apiClient,
    this.model = 'gemini-3.8-flash',
  }) : _apiClient = apiClient ?? ApiClient();

  static const _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/interactions';
  static const _apiRevision = '2026-05-20';

  final String apiKey;
  final ApiClient _apiClient;
  final String model;

  Future<Message> sendMessages(List<Message> messages) async {
    final response = await _apiClient.post<dynamic>(
      _endpoint,
      data: {
        'model': model,
        'input': messages.map((message) => message.toJson()).toList(),
      },
      options: Options(
        headers: {
          'x-goog-api-key': apiKey,
          'Api-Revision': _apiRevision,
          'Content-Type': 'application/json',
        },
      ),
    );

    final responseData = response.data;
    if (responseData is! Map) {
      throw const FormatException('Gemini returned an invalid response.');
    }

    final steps = responseData['steps'];
    if (steps is! List) {
      throw const FormatException('Gemini response does not contain steps.');
    }

    for (final step in steps.reversed) {
      if (step is Map && step['type'] == MessageType.modelOutput.value) {
        return Message.fromJson(Map<String, dynamic>.from(step));
      }
    }

    throw const FormatException(
      'Gemini response does not contain a model output.',
    );
  }
}
