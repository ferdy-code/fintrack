import 'package:dio/dio.dart';
import '../models/transaction_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';
import '../../core/constants/app_constants.dart';

class TransactionRepository {
  final Dio _dio = DioClient.instance;

  Future<List<TransactionModel>> getTransactions({
    int page = 1,
    String? type,
    String? categoryId,
    String? walletId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await _dio.get(ApiEndpoints.transactions, queryParameters: {
        'page': page,
        'limit': AppConstants.paginationLimit,
        if (type != null) 'type': type,
        if (categoryId != null) 'category_id': categoryId,
        if (walletId != null) 'wallet_id': walletId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
      });
      final list = response.data['data'] as List;
      return list.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<TransactionModel> createTransaction(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(ApiEndpoints.transactions, data: data);
      return TransactionModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<TransactionModel> getTransaction(String id) async {
    try {
      final response = await _dio.get(ApiEndpoints.transactionDetail(id));
      return TransactionModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<TransactionModel> updateTransaction(String id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(ApiEndpoints.transactionDetail(id), data: data);
      return TransactionModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await _dio.delete(ApiEndpoints.transactionDetail(id));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
