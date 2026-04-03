import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_file/open_file.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';

class ExportRepository {
  final Dio _dio = DioClient.instance;

  Future<String> exportTransactionsCsv({
    DateTime? startDate,
    DateTime? endDate,
    int? walletId,
    int? categoryId,
    String? type,
  }) async {
    final dir = await getTemporaryDirectory();
    final fileName =
        'transactions_${DateTime.now().millisecondsSinceEpoch}.csv';
    final savePath = '${dir.path}/$fileName';

    try {
      await _dio.download(
        '${ApiEndpoints.exportData}/transactions/csv',
        savePath,
        queryParameters: {
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
          if (walletId != null) 'wallet_id': walletId,
          if (categoryId != null) 'category_id': categoryId,
          if (type != null) 'type': type,
        },
        options: Options(responseType: ResponseType.bytes),
      );
      return savePath;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<String> exportTransactionsPdf({
    DateTime? startDate,
    DateTime? endDate,
    int? walletId,
    int? categoryId,
    String? type,
  }) async {
    final dir = await getTemporaryDirectory();
    final fileName =
        'transactions_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final savePath = '${dir.path}/$fileName';

    try {
      await _dio.download(
        '${ApiEndpoints.exportData}/transactions/pdf',
        savePath,
        queryParameters: {
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
          if (walletId != null) 'wallet_id': walletId,
          if (categoryId != null) 'category_id': categoryId,
          if (type != null) 'type': type,
        },
        options: Options(responseType: ResponseType.bytes),
      );
      return savePath;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<String> exportMonthlyReportPdf({
    required int year,
    required int month,
  }) async {
    final dir = await getTemporaryDirectory();
    final fileName =
        'report_${year}_${month}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final savePath = '${dir.path}/$fileName';

    try {
      await _dio.download(
        '${ApiEndpoints.exportData}/report/pdf',
        savePath,
        queryParameters: {'year': year, 'month': month},
        options: Options(responseType: ResponseType.bytes),
      );
      return savePath;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> shareFile(String path) async {
    await Share.shareXFiles([XFile(path)]);
  }

  Future<void> openExportedFile(String path) async {
    await OpenFile.open(path);
  }
}
