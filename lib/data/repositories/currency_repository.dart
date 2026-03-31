import 'package:dio/dio.dart';
import '../models/currency_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class CurrencyRepository {
  final Dio _dio = DioClient.instance;

  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      final response = await _dio.get(ApiEndpoints.currencies);
      final list = response.data['data'] as List;
      return list.map((e) => CurrencyModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
