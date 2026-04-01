import 'package:dio/dio.dart';
import '../models/transaction_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';
import '../../core/constants/app_constants.dart';

class TransactionRepository {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>> getTransactions({
    int page = 1,
    int? perPage,
    String? walletId,
    String? categoryId,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.transactions,
        queryParameters: {
          'page': page,
          'per_page': perPage ?? AppConstants.paginationLimit,
          if (walletId != null) 'wallet_id': walletId,
          if (categoryId != null) 'category_id': categoryId,
          if (type != null) 'type': type,
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
          if (search != null) 'search': search,
          if (sortBy != null) 'sort_by': sortBy,
          if (sortOrder != null) 'sort_order': sortOrder,
        },
      );
      final list = (response.data['data'] as List)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final meta = response.data['meta'] as Map<String, dynamic>?;
      return {'transactions': list, 'meta': meta};
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<TransactionModel> createTransaction({
    required int walletId,
    required int categoryId,
    required String type,
    required double amount,
    String? description,
    String? merchantName,
    required DateTime transactionDate,
    String? notes,
    int? destinationWalletId,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.transactions,
        data: {
          'wallet_id': walletId,
          'category_id': categoryId,
          'type': type,
          'amount': amount,
          if (description != null) 'description': description,
          if (merchantName != null) 'merchant_name': merchantName,
          'transaction_date': transactionDate.toIso8601String(),
          if (notes != null) 'notes': notes,
          if (destinationWalletId != null)
            'destination_wallet_id': destinationWalletId,
        },
      );
      return TransactionModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<TransactionModel> getTransaction(int id) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.transactionDetail(id.toString()),
      );
      return TransactionModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<TransactionModel> updateTransaction(
    int id, {
    int? walletId,
    int? categoryId,
    String? type,
    double? amount,
    String? description,
    String? merchantName,
    DateTime? transactionDate,
    String? notes,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.transactionDetail(id.toString()),
        data: {
          if (walletId != null) 'wallet_id': walletId,
          if (categoryId != null) 'category_id': categoryId,
          if (type != null) 'type': type,
          if (amount != null) 'amount': amount,
          if (description != null) 'description': description,
          if (merchantName != null) 'merchant_name': merchantName,
          if (transactionDate != null)
            'transaction_date': transactionDate.toIso8601String(),
          if (notes != null) 'notes': notes,
        },
      );
      return TransactionModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteTransaction(int id) async {
    try {
      await _dio.delete(ApiEndpoints.transactionDetail(id.toString()));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getSummary({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.transactions}/summary',
        queryParameters: {
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
        },
      );
      return response.data['data'] as Map<String, dynamic>;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
