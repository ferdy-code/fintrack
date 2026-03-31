import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/wallet_model.dart';
import '../../../../data/repositories/wallet_repository.dart';

final walletRepositoryProvider = Provider((ref) => WalletRepository());

final walletsProvider = FutureProvider<List<WalletModel>>((ref) async {
  final repo = ref.watch(walletRepositoryProvider);
  return repo.getWallets();
});
