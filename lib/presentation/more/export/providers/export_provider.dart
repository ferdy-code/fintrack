import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/export_repository.dart';

final exportRepositoryProvider = Provider((ref) => ExportRepository());

final exportProvider = StateProvider<AsyncValue<String?>>((ref) => const AsyncValue.data(null));
