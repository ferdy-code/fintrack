import 'package:dio/dio.dart';
import '../models/recurring_transaction_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class RecurringRepository {
  final Dio _dio = DioClient.instance;

  Future<List<RecurringTransactionModel>> getRecurring() async {
    try {
      final response = await _dio.get(ApiEndpoints.recurring);
      final list = response.data['data'] as List;
      return list.map((e) => RecurringTransactionModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<RecurringTransactionModel> createRecurring(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(ApiEndpoints.recurring, data: data);
      return RecurringTransactionModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteRecurring(String id) async {
    try {
      await _dio.delete(ApiEndpoints.recurringDetail(id));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
