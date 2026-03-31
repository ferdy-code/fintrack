import 'package:dio/dio.dart';
import '../models/category_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class CategoryRepository {
  final Dio _dio = DioClient.instance;

  Future<List<CategoryModel>> getCategories({String? type}) async {
    try {
      final response = await _dio.get(ApiEndpoints.categories, queryParameters: {
        if (type != null) 'type': type,
      });
      final list = response.data['data'] as List;
      return list.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<CategoryModel> createCategory(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(ApiEndpoints.categories, data: data);
      return CategoryModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _dio.delete(ApiEndpoints.categoryDetail(id));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
