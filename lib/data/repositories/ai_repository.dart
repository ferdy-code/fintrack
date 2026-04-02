import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/chat_session_model.dart';
import '../models/chat_message_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class AiRepository {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>> categorizeTransaction({
    String? description,
    String? merchantName,
    double? amount,
    String? type,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.aiInsights}/categorize',
        data: {
          if (description != null) 'description': description,
          if (merchantName != null) 'merchant_name': merchantName,
          if (amount != null) 'amount': amount,
          if (type != null) 'type': type,
        },
      );
      return response.data['data'] as Map<String, dynamic>;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getInsights() async {
    try {
      final response = await _dio.get(ApiEndpoints.aiInsights);
      return response.data['data'] as Map<String, dynamic>;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Stream<String> sendChatMessage({
    required String message,
    int? sessionId,
  }) async* {
    try {
      final response = await _dio.post(
        ApiEndpoints.aiChat,
        data: {
          'message': message,
          if (sessionId != null) 'session_id': sessionId,
        },
        options: Options(
          responseType: ResponseType.stream,
          headers: {'Accept': 'text/event-stream'},
        ),
      );

      final rawData = response.data;

      if (rawData is ResponseBody) {
        yield* rawData.stream
            .map((chunk) => utf8.decode(chunk))
            .transform(const LineSplitter())
            .where((line) => line.startsWith('data: '))
            .map((line) => line.substring(6).trim())
            .where((data) => data.isNotEmpty && data != '[DONE]')
            .map((data) {
              try {
                final json = jsonDecode(data) as Map<String, dynamic>;
                return json['content'] as String? ??
                    json['message'] as String? ??
                    json['text'] as String? ??
                    '';
              } catch (_) {
                return data;
              }
            });
      } else if (rawData is Map<String, dynamic>) {
        final data = rawData['data'] as Map<String, dynamic>?;
        if (data != null) {
          final content =
              data['content'] as String? ??
              data['message'] as String? ??
              data['response'] as String? ??
              data['text'] as String? ??
              jsonEncode(data);
          yield content;
        } else {
          final content =
              rawData['content'] as String? ??
              rawData['message'] as String? ??
              rawData['response'] as String? ??
              rawData['text'] as String? ??
              jsonEncode(rawData);
          yield content;
        }
      } else if (rawData is String) {
        yield rawData;
      } else {
        yield rawData.toString();
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<List<ChatSessionModel>> getChatSessions() async {
    try {
      final response = await _dio.get('${ApiEndpoints.aiChat}/sessions');
      final list = response.data['data'] as List;
      return list
          .map((e) => ChatSessionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<List<ChatMessageModel>> getChatHistory(int sessionId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.aiChat}/sessions/$sessionId',
      );
      final list = response.data['data']['messages'] as List;
      return list
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteChatSession(int sessionId) async {
    try {
      await _dio.delete('${ApiEndpoints.aiChat}/sessions/$sessionId');
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
