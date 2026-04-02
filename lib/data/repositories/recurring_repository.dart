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
      return list
          .map(
            (e) =>
                RecurringTransactionModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<RecurringTransactionModel> createRecurring({
    required int walletId,
    int? categoryId,
    required String type,
    required double amount,
    required String frequency,
    required DateTime nextDueDate,
    String? description,
    String? merchantName,
    bool autoCreate = false,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.recurring,
        data: {
          'wallet_id': walletId,
          if (categoryId != null) 'category_id': categoryId,
          'type': type,
          'amount': amount,
          'frequency': frequency,
          'next_due_date': nextDueDate.toIso8601String(),
          if (description != null) 'description': description,
          if (merchantName != null) 'merchant_name': merchantName,
          'auto_create': autoCreate,
        },
      );
      return RecurringTransactionModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<RecurringTransactionModel> updateRecurring(
    int id, {
    int? walletId,
    int? categoryId,
    String? type,
    double? amount,
    String? frequency,
    DateTime? nextDueDate,
    String? description,
    String? merchantName,
    bool? autoCreate,
    bool? isActive,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.recurringDetail(id.toString()),
        data: {
          if (walletId != null) 'wallet_id': walletId,
          if (categoryId != null) 'category_id': categoryId,
          if (type != null) 'type': type,
          if (amount != null) 'amount': amount,
          if (frequency != null) 'frequency': frequency,
          if (nextDueDate != null)
            'next_due_date': nextDueDate.toIso8601String(),
          if (description != null) 'description': description,
          if (merchantName != null) 'merchant_name': merchantName,
          if (autoCreate != null) 'auto_create': autoCreate,
          if (isActive != null) 'is_active': isActive,
        },
      );
      return RecurringTransactionModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteRecurring(int id) async {
    try {
      await _dio.delete(ApiEndpoints.recurringDetail(id.toString()));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> skipNext(int id) async {
    try {
      await _dio.post('${ApiEndpoints.recurringDetail(id.toString())}/skip');
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> processNow(int id) async {
    try {
      await _dio.post('${ApiEndpoints.recurringDetail(id.toString())}/process');
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
