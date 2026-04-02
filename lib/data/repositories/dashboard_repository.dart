import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/dashboard_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_exceptions.dart';

class DashboardRepository {
  final Dio _dio = DioClient.instance;

  Future<DashboardModel> getDashboard() async {
    try {
      final response = await _dio.get('/dashboard');
      log('Dashboard raw data: ${response.data['data']}');
      return DashboardModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e, stack) {
      log('Dashboard parse error: $e');
      log('Stack: $stack');
      rethrow;
    }
  }
}
