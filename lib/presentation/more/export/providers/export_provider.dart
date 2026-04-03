import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/export_repository.dart';

enum ExportType { csv, pdf, monthlyReport }

enum ExportStatus { initial, loading, success, error }

class ExportState {
  final ExportType exportType;
  final ExportStatus status;
  final String? filePath;
  final String? errorMessage;

  const ExportState({
    this.exportType = ExportType.csv,
    this.status = ExportStatus.initial,
    this.filePath,
    this.errorMessage,
  });

  ExportState copyWith({
    ExportType? exportType,
    ExportStatus? status,
    String? filePath,
    String? errorMessage,
  }) {
    return ExportState(
      exportType: exportType ?? this.exportType,
      status: status ?? this.status,
      filePath: filePath ?? this.filePath,
      errorMessage: errorMessage,
    );
  }
}

class ExportNotifier extends StateNotifier<ExportState> {
  final ExportRepository _repository;

  ExportNotifier(this._repository) : super(const ExportState());

  void setExportType(ExportType type) {
    state = state.copyWith(exportType: type, status: ExportStatus.initial);
  }

  Future<void> exportTransactionsCsv({
    DateTime? startDate,
    DateTime? endDate,
    int? walletId,
    int? categoryId,
    String? type,
  }) async {
    state = state.copyWith(status: ExportStatus.loading);
    try {
      final path = await _repository.exportTransactionsCsv(
        startDate: startDate,
        endDate: endDate,
        walletId: walletId,
        categoryId: categoryId,
        type: type,
      );
      state = state.copyWith(status: ExportStatus.success, filePath: path);
    } catch (e) {
      state = state.copyWith(
        status: ExportStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> exportTransactionsPdf({
    DateTime? startDate,
    DateTime? endDate,
    int? walletId,
    int? categoryId,
    String? type,
  }) async {
    state = state.copyWith(status: ExportStatus.loading);
    try {
      final path = await _repository.exportTransactionsPdf(
        startDate: startDate,
        endDate: endDate,
        walletId: walletId,
        categoryId: categoryId,
        type: type,
      );
      state = state.copyWith(status: ExportStatus.success, filePath: path);
    } catch (e) {
      state = state.copyWith(
        status: ExportStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> exportMonthlyReport({
    required int year,
    required int month,
  }) async {
    state = state.copyWith(status: ExportStatus.loading);
    try {
      final path = await _repository.exportMonthlyReportPdf(
        year: year,
        month: month,
      );
      state = state.copyWith(status: ExportStatus.success, filePath: path);
    } catch (e) {
      state = state.copyWith(
        status: ExportStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> shareFile(String path) async {
    await _repository.shareFile(path);
  }

  Future<void> openFile(String path) async {
    await _repository.openExportedFile(path);
  }

  void reset() {
    state = const ExportState();
  }
}

final exportRepositoryProvider = Provider((ref) => ExportRepository());

final exportProvider = StateNotifierProvider<ExportNotifier, ExportState>((
  ref,
) {
  return ExportNotifier(ref.watch(exportRepositoryProvider));
});
