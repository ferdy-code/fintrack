import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class ExportRepository {
  final Dio _dio = DioClient.instance;

  Future<String> exportData({required String format, DateTime? startDate, DateTime? endDate}) async {
    try {
      final response = await _dio.post(ApiEndpoints.exportData, data: {
        'format': format,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
      });
      return response.data['data']['url'] as String;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
