import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/dashboard_model.dart';
import '../../../data/repositories/dashboard_repository.dart';

final dashboardRepositoryProvider = Provider((ref) => DashboardRepository());

class DashboardState {
  final DashboardModel? data;
  final bool isLoading;
  final String? errorMessage;

  const DashboardState({this.data, this.isLoading = false, this.errorMessage});

  DashboardState copyWith({
    DashboardModel? data,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DashboardState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const DashboardState());

  Future<void> fetchDashboard() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final data = await _repository.getDashboard();
      state = state.copyWith(data: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
      final notifier = DashboardNotifier(ref.read(dashboardRepositoryProvider));
      notifier.fetchDashboard();
      return notifier;
    });
