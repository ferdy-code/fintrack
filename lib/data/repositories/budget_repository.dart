import 'package:dio/dio.dart';
import '../models/budget_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class BudgetRepository {
  final Dio _dio = DioClient.instance;

  Future<List<BudgetModel>> getBudgets() async {
    try {
      final response = await _dio.get(ApiEndpoints.budgets);
      final list = response.data['data'] as List;
      return list
          .map((e) => BudgetModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getBudgetOverview() async {
    try {
      final response = await _dio.get('${ApiEndpoints.budgets}/overview');
      return response.data['data'] as Map<String, dynamic>;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<BudgetModel> createBudget({
    required int categoryId,
    required double amount,
    required String period,
    double? alertThreshold,
    DateTime? startDate,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.budgets,
        data: {
          'category_id': categoryId,
          'amount': amount,
          'period': period,
          if (alertThreshold != null) 'alert_threshold': alertThreshold,
          if (startDate != null) 'start_date': startDate.toIso8601String(),
        },
      );
      return BudgetModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<BudgetModel> updateBudget(
    int id, {
    int? categoryId,
    double? amount,
    String? period,
    double? alertThreshold,
    DateTime? startDate,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.budgetDetail(id.toString()),
        data: {
          if (categoryId != null) 'category_id': categoryId,
          if (amount != null) 'amount': amount,
          if (period != null) 'period': period,
          if (alertThreshold != null) 'alert_threshold': alertThreshold,
          if (startDate != null) 'start_date': startDate.toIso8601String(),
        },
      );
      return BudgetModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteBudget(int id) async {
    try {
      await _dio.delete(ApiEndpoints.budgetDetail(id.toString()));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<BudgetModel> getBudget(int id) async {
    try {
      final response = await _dio.get(ApiEndpoints.budgetDetail(id.toString()));
      return BudgetModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
