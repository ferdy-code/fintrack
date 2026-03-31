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
      return list.map((e) => BudgetModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<BudgetModel> createBudget(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(ApiEndpoints.budgets, data: data);
      return BudgetModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<BudgetModel> getBudget(String id) async {
    try {
      final response = await _dio.get(ApiEndpoints.budgetDetail(id));
      return BudgetModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<BudgetModel> updateBudget(String id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(ApiEndpoints.budgetDetail(id), data: data);
      return BudgetModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteBudget(String id) async {
    try {
      await _dio.delete(ApiEndpoints.budgetDetail(id));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
