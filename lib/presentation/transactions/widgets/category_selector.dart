import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../more/categories/providers/category_provider.dart';
import '../../../../data/models/category_model.dart';

class CategorySelector extends ConsumerWidget {
  final String? selectedCategoryId;
  final String type;
  final ValueChanged<CategoryModel> onCategorySelected;

  const CategorySelector({
    super.key,
    this.selectedCategoryId,
    required this.type,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryListProvider);

    return switch (state.status) {
      CategoryListStatus.loading => const Center(
        child: CircularProgressIndicator(),
      ),
      CategoryListStatus.error => Center(
        child: Text(state.errorMessage ?? 'Error'),
      ),
      _ =>
        state.categories.isEmpty
            ? const Center(child: Text('No categories'))
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final cat = state.categories[index];
                  final selected = selectedCategoryId == cat.id.toString();
                  Color catColor = Colors.grey;
                  try {
                    catColor = Color(
                      int.parse(cat.color.replaceFirst('#', '0xFF')),
                    );
                  } catch (_) {}

                  const iconMap = {
                    'restaurant': Icons.restaurant_rounded,
                    'directions_car': Icons.directions_car_rounded,
                    'shopping_bag': Icons.shopping_bag_rounded,
                    'home': Icons.home_rounded,
                    'local_hospital': Icons.local_hospital_rounded,
                    'school': Icons.school_rounded,
                    'flight': Icons.flight_rounded,
                    'sports_soccer': Icons.sports_soccer_rounded,
                    'movie': Icons.movie_rounded,
                    'work': Icons.work_rounded,
                    'pets': Icons.pets_rounded,
                    'music_note': Icons.music_note_rounded,
                    'category': Icons.category_rounded,
                    'attach_money': Icons.attach_money_rounded,
                    'trending_up': Icons.trending_up_rounded,
                    'card_giftcard': Icons.card_giftcard_rounded,
                  };
                  final icon = iconMap[cat.icon] ?? Icons.category_rounded;

                  return InkWell(
                    onTap: () {
                      onCategorySelected(cat);
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                          width: selected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon, color: catColor, size: 24),
                          const SizedBox(height: 4),
                          Text(
                            cat.name,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    };
  }

  static void show({
    required BuildContext context,
    required String type,
    String? selectedCategoryId,
    required ValueChanged<CategoryModel> onCategorySelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.8,
        minChildSize: 0.3,
        expand: false,
        builder: (context, controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'Select Category',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: CategorySelector(
                selectedCategoryId: selectedCategoryId,
                type: type,
                onCategorySelected: onCategorySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
