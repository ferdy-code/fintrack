import 'package:dio/dio.dart';
import '../models/ai_insight_model.dart';
import '../models/chat_message_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class AiRepository {
  final Dio _dio = DioClient.instance;

  Future<List<AiInsightModel>> getInsights() async {
    try {
      final response = await _dio.get(ApiEndpoints.aiInsights);
      final list = response.data['data'] as List;
      return list.map((e) => AiInsightModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<ChatMessageModel> sendMessage(String sessionId, String message) async {
    try {
      final response = await _dio.post(ApiEndpoints.aiChat, data: {
        'session_id': sessionId,
        'message': message,
      });
      return ChatMessageModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<List<ChatMessageModel>> getChatHistory(String sessionId) async {
    try {
      final response = await _dio.get('${ApiEndpoints.aiChat}/$sessionId');
      final list = response.data['data'] as List;
      return list.map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
