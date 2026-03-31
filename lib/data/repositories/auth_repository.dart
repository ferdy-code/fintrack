import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';
import '../../data/local/secure_storage_service.dart';

class AuthRepository {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(ApiEndpoints.login, data: {
        'email': email,
        'password': password,
      });
      final token = response.data['token'] as String;
      final user = response.data['user'] as Map<String, dynamic>;
      await SecureStorageService.saveToken(token);
      await SecureStorageService.saveUser(UserModel.fromJson(user).toString());
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(ApiEndpoints.register, data: {
        'name': name,
        'email': email,
        'password': password,
      });
      final token = response.data['token'] as String;
      await SecureStorageService.saveToken(token);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(ApiEndpoints.logout);
    } catch (_) {}
    await SecureStorageService.deleteAll();
  }

  Future<UserModel> getProfile() async {
    try {
      final response = await _dio.get(ApiEndpoints.profile);
      return UserModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
