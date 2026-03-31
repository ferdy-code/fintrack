import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/wallet_model.dart';
import '../../../../data/repositories/wallet_repository.dart';

enum WalletListStatus { initial, loading, loaded, error }

class WalletListState {
  final WalletListStatus status;
  final List<WalletModel> wallets;
  final String? errorMessage;

  const WalletListState({
    this.status = WalletListStatus.initial,
    this.wallets = const [],
    this.errorMessage,
  });

  WalletListState copyWith({
    WalletListStatus? status,
    List<WalletModel>? wallets,
    String? errorMessage,
  }) {
    return WalletListState(
      status: status ?? this.status,
      wallets: wallets ?? this.wallets,
      errorMessage: errorMessage,
    );
  }
}

class WalletListNotifier extends StateNotifier<WalletListState> {
  final WalletRepository _repository;

  WalletListNotifier(this._repository) : super(const WalletListState());

  Future<void> fetchWallets() async {
    state = state.copyWith(status: WalletListStatus.loading);
    try {
      final wallets = await _repository.getWallets();
      state = state.copyWith(status: WalletListStatus.loaded, wallets: wallets);
    } catch (e) {
      state = state.copyWith(
        status: WalletListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> addWallet({
    required String name,
    required String type,
    required String currencyCode,
    required double balance,
    String? icon,
    String? color,
  }) async {
    try {
      final wallet = await _repository.createWallet(
        name: name,
        type: type,
        currencyCode: currencyCode,
        balance: balance,
        icon: icon,
        color: color,
      );
      state = state.copyWith(wallets: [...state.wallets, wallet]);
    } catch (e) {
      state = state.copyWith(
        status: WalletListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> editWallet(
    String id, {
    String? name,
    String? type,
    double? balance,
    String? icon,
    String? color,
  }) async {
    try {
      final updated = await _repository.updateWallet(
        id,
        name: name,
        type: type,
        balance: balance,
        icon: icon,
        color: color,
      );
      state = state.copyWith(
        wallets: state.wallets
            .map((w) => w.id == updated.id ? updated : w)
            .toList(),
      );
    } catch (e) {
      state = state.copyWith(
        status: WalletListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<bool> removeWallet(String id) async {
    try {
      await _repository.deleteWallet(id);
      state = state.copyWith(
        wallets: state.wallets.where((w) => w.id.toString() != id).toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        status: WalletListStatus.error,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final walletRepositoryProvider = Provider((ref) => WalletRepository());

final walletListProvider =
    StateNotifierProvider<WalletListNotifier, WalletListState>((ref) {
      final notifier = WalletListNotifier(ref.watch(walletRepositoryProvider));
      notifier.fetchWallets();
      return notifier;
    });
