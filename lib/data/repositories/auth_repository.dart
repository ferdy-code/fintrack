import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';
import '../../data/local/secure_storage_service.dart';

class AuthRepository {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String defaultCurrencyCode,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'default_currency_code': defaultCurrencyCode,
        },
      );
      final token = response.data['data']['token'] as String;
      final userJson = response.data['data']['user'] as Map<String, dynamic>;
      final user = UserModel.fromJson(userJson);
      await SecureStorageService.saveToken(token);
      await SecureStorageService.saveUser(jsonEncode(userJson));
      return {'user': user, 'token': token};
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      final token = response.data['data']['token'] as String;
      final userJson = response.data['data']['user'] as Map<String, dynamic>;
      final user = UserModel.fromJson(userJson);
      await SecureStorageService.saveToken(token);
      await SecureStorageService.saveUser(jsonEncode(userJson));
      return {'user': user, 'token': token};
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

  Future<UserModel> getUser() async {
    try {
      final response = await _dio.get(ApiEndpoints.profile);
      final data = response.data['data'] as Map<String, dynamic>?;
      final userJson = data ?? response.data as Map<String, dynamic>;
      await SecureStorageService.saveUser(jsonEncode(userJson));
      return UserModel.fromJson(userJson);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<UserModel> updateProfile({
    required String name,
    required String defaultCurrencyCode,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.profile,
        data: {'name': name, 'default_currency_code': defaultCurrencyCode},
      );
      final userJson = response.data['data'] as Map<String, dynamic>?;
      if (userJson != null) {
        await SecureStorageService.saveUser(jsonEncode(userJson));
        return UserModel.fromJson(userJson);
      }
      return await getUser();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      await _dio.put(
        '/auth/password',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirmation': newPasswordConfirmation,
        },
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
