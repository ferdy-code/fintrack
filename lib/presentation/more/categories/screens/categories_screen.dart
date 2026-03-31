import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/category_provider.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  String _selectedType = 'expense';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(categoryListProvider.notifier)
          .fetchCategories(type: _selectedType);
    });
  }

  void _onTypeChanged(String type) {
    setState(() => _selectedType = type);
    ref.read(categoryListProvider.notifier).fetchCategories(type: type);
  }

  static const _iconOptions = [
    ('restaurant', Icons.restaurant_rounded),
    ('directions_car', Icons.directions_car_rounded),
    ('shopping_bag', Icons.shopping_bag_rounded),
    ('home', Icons.home_rounded),
    ('local_hospital', Icons.local_hospital_rounded),
    ('school', Icons.school_rounded),
    ('flight', Icons.flight_rounded),
    ('sports_soccer', Icons.sports_soccer_rounded),
    ('movie', Icons.movie_rounded),
    ('work', Icons.work_rounded),
    ('pets', Icons.pets_rounded),
    ('music_note', Icons.music_note_rounded),
    ('category', Icons.category_rounded),
    ('attach_money', Icons.attach_money_rounded),
    ('trending_up', Icons.trending_up_rounded),
    ('card_giftcard', Icons.card_giftcard_rounded),
  ];

  static const _colorOptions = AppColors.categoryColors;

  Widget _buildIconPicker(
    String selectedIcon,
    ValueChanged<String> onSelect,
    void Function(VoidCallback) setDialogState,
  ) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: _iconOptions.map((entry) {
        final (name, icon) = entry;
        final sel = selectedIcon == name;
        return InkWell(
          onTap: () => setDialogState(() => onSelect(name)),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: sel
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: sel ? Theme.of(context).colorScheme.primary : null,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildColorPicker(
    String selectedColor,
    ValueChanged<String> onSelect,
    void Function(VoidCallback) setDialogState,
  ) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: _colorOptions.map((color) {
        final hex =
            '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
        final sel = selectedColor == hex;
        return InkWell(
          onTap: () => setDialogState(() => onSelect(hex)),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: sel ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
            child: sel
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 16)
                : null,
          ),
        );
      }).toList(),
    );
  }

  void _showAddCategoryDialog() {
    final nameController = TextEditingController();
    String selectedIcon = 'category';
    String selectedColor = '#3B82F6';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Add Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Category Name'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Icon',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                _buildIconPicker(
                  selectedIcon,
                  (v) => selectedIcon = v,
                  setDialogState,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Color',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                _buildColorPicker(
                  selectedColor,
                  (v) => selectedColor = v,
                  setDialogState,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty) return;
                ref
                    .read(categoryListProvider.notifier)
                    .addCategory(
                      name: nameController.text.trim(),
                      type: _selectedType,
                      icon: selectedIcon,
                      color: selectedColor,
                    );
                Navigator.pop(ctx);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditCategoryDialog(
    int id,
    String currentName,
    String currentIcon,
    String currentColor,
  ) {
    final nameController = TextEditingController(text: currentName);
    String selectedIcon = currentIcon;
    String selectedColor = currentColor;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Edit Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Category Name'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Icon',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                _buildIconPicker(
                  selectedIcon,
                  (v) => selectedIcon = v,
                  setDialogState,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Color',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                _buildColorPicker(
                  selectedColor,
                  (v) => selectedColor = v,
                  setDialogState,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty) return;
                ref
                    .read(categoryListProvider.notifier)
                    .editCategory(
                      id.toString(),
                      name: nameController.text.trim(),
                      icon: selectedIcon,
                      color: selectedColor,
                    );
                Navigator.pop(ctx);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _parseIcon(String iconName) {
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
    return iconMap[iconName] ?? Icons.category_rounded;
  }

  Color _parseColor(String colorHex) {
    try {
      return Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'expense', label: Text('Expense')),
                ButtonSegment(value: 'income', label: Text('Income')),
              ],
              selected: {_selectedType},
              onSelectionChanged: (v) => _onTypeChanged(v.first),
            ),
          ),
          Expanded(
            child: switch (state.status) {
              CategoryListStatus.initial || CategoryListStatus.loading =>
                const Center(child: CircularProgressIndicator()),
              CategoryListStatus.error => Center(
                child: Text(state.errorMessage ?? 'Error'),
              ),
              CategoryListStatus.loaded =>
                state.categories.isEmpty
                    ? const Center(
                        child: Text(
                          'No categories',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final cat = state.categories[index];
                          final color = _parseColor(cat.color);
                          final icon = _parseIcon(cat.icon);

                          if (cat.isSystem) {
                            return ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(icon, color: color, size: 20),
                              ),
                              title: Text(cat.name),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'System',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          }

                          return Dismissible(
                            key: ValueKey(cat.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 24),
                              color: Colors.red,
                              child: const Icon(
                                Icons.delete_rounded,
                                color: Colors.white,
                              ),
                            ),
                            confirmDismiss: (_) async {
                              return await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Delete Category'),
                                  content: Text('Delete "${cat.name}"?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(ctx, false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx, true),
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (_) {
                              ref
                                  .read(categoryListProvider.notifier)
                                  .removeCategory(cat.id.toString());
                            },
                            child: ListTile(
                              onTap: () => _showEditCategoryDialog(
                                cat.id,
                                cat.name,
                                cat.icon,
                                cat.color,
                              ),
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(icon, color: color, size: 20),
                              ),
                              title: Text(cat.name),
                            ),
                          );
                        },
                      ),
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryDialog,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
