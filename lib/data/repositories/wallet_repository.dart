import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/wallet_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class WalletRepository {
  final Dio _dio = DioClient.instance;

  Future<List<WalletModel>> getWallets() async {
    try {
      final response = await _dio.get(ApiEndpoints.wallets);
      final list = response.data['data'] as List;
      log(list.toString());
      return list
          .map((e) => WalletModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<WalletModel> createWallet({
    required String name,
    required String type,
    required String currencyCode,
    required double balance,
    String? icon,
    String? color,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.wallets,
        data: {
          'name': name,
          'type': type.toLowerCase(),
          'currency_code': currencyCode,
          'balance': balance,
          if (icon != null) 'icon': icon,
          if (color != null) 'color': color,
        },
      );
      log(response.data['data'].toString());
      return WalletModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<WalletModel> updateWallet(
    String id, {
    String? name,
    String? type,
    double? balance,
    String? icon,
    String? color,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.walletDetail(id),
        data: {
          if (name != null) 'name': name,
          if (type != null) 'type': type,
          if (balance != null) 'balance': balance,
          if (icon != null) 'icon': icon,
          if (color != null) 'color': color,
        },
      );
      return WalletModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> deleteWallet(String id) async {
    try {
      await _dio.delete(ApiEndpoints.walletDetail(id));
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
