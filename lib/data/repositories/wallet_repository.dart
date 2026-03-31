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
      return list.map((e) => WalletModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<WalletModel> createWallet(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(ApiEndpoints.wallets, data: data);
      return WalletModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<WalletModel> updateWallet(String id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(ApiEndpoints.walletDetail(id), data: data);
      return WalletModel.fromJson(response.data['data'] as Map<String, dynamic>);
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
