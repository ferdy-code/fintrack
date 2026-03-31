import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/repositories/category_repository.dart';

enum CategoryListStatus { initial, loading, loaded, error }

class CategoryListState {
  final CategoryListStatus status;
  final List<CategoryModel> categories;
  final String? errorMessage;

  const CategoryListState({
    this.status = CategoryListStatus.initial,
    this.categories = const [],
    this.errorMessage,
  });

  CategoryListState copyWith({
    CategoryListStatus? status,
    List<CategoryModel>? categories,
    String? errorMessage,
  }) {
    return CategoryListState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      errorMessage: errorMessage,
    );
  }
}

class CategoryListNotifier extends StateNotifier<CategoryListState> {
  final CategoryRepository _repository;

  CategoryListNotifier(this._repository) : super(const CategoryListState());

  Future<void> fetchCategories({String? type}) async {
    state = state.copyWith(status: CategoryListStatus.loading);
    try {
      final categories = await _repository.getCategories(type: type);
      state = state.copyWith(
        status: CategoryListStatus.loaded,
        categories: categories,
      );
    } catch (e) {
      state = state.copyWith(
        status: CategoryListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> addCategory({
    required String name,
    required String type,
    required String icon,
    required String color,
  }) async {
    try {
      final category = await _repository.createCategory(
        name: name,
        type: type,
        icon: icon,
        color: color,
      );
      state = state.copyWith(categories: [...state.categories, category]);
    } catch (e) {
      state = state.copyWith(
        status: CategoryListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> editCategory(
    String id, {
    String? name,
    String? icon,
    String? color,
  }) async {
    try {
      final updated = await _repository.updateCategory(
        id,
        name: name,
        icon: icon,
        color: color,
      );
      state = state.copyWith(
        categories: state.categories
            .map((c) => c.id == updated.id ? updated : c)
            .toList(),
      );
    } catch (e) {
      state = state.copyWith(
        status: CategoryListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<bool> removeCategory(String id) async {
    try {
      await _repository.deleteCategory(id);
      state = state.copyWith(
        categories: state.categories
            .where((c) => c.id.toString() != id)
            .toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        status: CategoryListStatus.error,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final categoryRepositoryProvider = Provider((ref) => CategoryRepository());

final categoryListProvider =
    StateNotifierProvider<CategoryListNotifier, CategoryListState>((ref) {
      final notifier = CategoryListNotifier(
        ref.watch(categoryRepositoryProvider),
      );
      notifier.fetchCategories();
      return notifier;
    });
