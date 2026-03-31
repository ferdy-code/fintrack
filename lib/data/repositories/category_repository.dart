import 'package:dio/dio.dart';
import '../models/category_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class CategoryRepository {
  final Dio _dio = DioClient.instance;

  Future<List<CategoryModel>> getCategories({String? type}) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.categories,
        queryParameters: {if (type != null) 'type': type},
      );
      final list = response.data['data'] as List;
      return list
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<CategoryModel> createCategory({
    required String name,
    required String type,
    required String icon,
    required String color,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.categories,
        data: {'name': name, 'type': type, 'icon': icon, 'color': color},
      );
      return CategoryModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<CategoryModel> updateCategory(
    String id, {
    String? name,
    String? icon,
    String? color,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.categoryDetail(id),
        data: {
          if (name != null) 'name': name,
          if (icon != null) 'icon': icon,
          if (color != null) 'color': color,
        },
      );
      return CategoryModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
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
