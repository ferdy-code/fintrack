import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/export_provider.dart';

class ExportScreen extends ConsumerStatefulWidget {
  const ExportScreen({super.key});

  @override
  ConsumerState<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends ConsumerState<ExportScreen> {
  ExportType _selectedType = ExportType.csv;
  DateTimeRange? _dateRange;
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  String? _selectedTypeFilter;
  bool _isExporting = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Export Data')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Export Type',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<ExportType>(
              segments: const [
                ButtonSegment(
                  value: ExportType.csv,
                  label: Text('CSV'),
                  icon: Icon(Icons.table_chart_rounded),
                ),
                ButtonSegment(
                  value: ExportType.pdf,
                  label: Text('PDF'),
                  icon: Icon(Icons.picture_as_pdf_rounded),
                ),
                ButtonSegment(
                  value: ExportType.monthlyReport,
                  label: Text('Report'),
                  icon: Icon(Icons.summarize_rounded),
                ),
              ],
              selected: {_selectedType},
              onSelectionChanged: (selection) {
                setState(() {
                  _selectedType = selection.first;
                  _isExporting = false;
                });
                ref.read(exportProvider.notifier).reset();
              },
            ),
            const SizedBox(height: 24),
            if (_selectedType == ExportType.monthlyReport)
              _buildMonthYearPicker(theme)
            else
              _buildTransactionFilters(theme),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton.icon(
                onPressed: _isExporting ? null : _handleExport,
                icon: _isExporting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.download_rounded),
                label: Text(_isExporting ? 'Exporting...' : 'Export'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionFilters(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Range',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickDateRange,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.date_range_rounded,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  _dateRange != null
                      ? '${DateFormat.yMMMd().format(_dateRange!.start)} - ${DateFormat.yMMMd().format(_dateRange!.end)}'
                      : 'Select date range (optional)',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _dateRange != null
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_dateRange != null) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => setState(() => _dateRange = null),
              child: const Text('Clear'),
            ),
          ),
        ],
        const SizedBox(height: 16),
        Text(
          'Transaction Type',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedTypeFilter,
          decoration: const InputDecoration(
            hintText: 'All types (optional)',
            prefixIcon: Icon(Icons.swap_vert_rounded),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          items: const [
            DropdownMenuItem(value: 'income', child: Text('Income')),
            DropdownMenuItem(value: 'expense', child: Text('Expense')),
          ],
          onChanged: (value) {
            setState(() => _selectedTypeFilter = value);
          },
        ),
      ],
    );
  }

  Widget _buildMonthYearPicker(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report Period',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                value: _selectedMonth,
                decoration: const InputDecoration(
                  labelText: 'Month',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                items: List.generate(
                  12,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Text(
                      DateFormat.MMMM().format(DateTime(2024, i + 1)),
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedMonth = value);
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<int>(
                value: _selectedYear,
                decoration: const InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                items: List.generate(5, (i) {
                  final year = DateTime.now().year - i;
                  return DropdownMenuItem(
                    value: year,
                    child: Text(year.toString()),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedYear = value);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _dateRange,
    );
    if (picked != null) {
      setState(() => _dateRange = picked);
    }
  }

  Future<void> _handleExport() async {
    setState(() => _isExporting = true);

    final notifier = ref.read(exportProvider.notifier);

    switch (_selectedType) {
      case ExportType.csv:
        await notifier.exportTransactionsCsv(
          startDate: _dateRange?.start,
          endDate: _dateRange?.end,
          type: _selectedTypeFilter,
        );
      case ExportType.pdf:
        await notifier.exportTransactionsPdf(
          startDate: _dateRange?.start,
          endDate: _dateRange?.end,
          type: _selectedTypeFilter,
        );
      case ExportType.monthlyReport:
        await notifier.exportMonthlyReport(
          year: _selectedYear,
          month: _selectedMonth,
        );
    }

    if (!mounted) return;
    setState(() => _isExporting = false);

    final exportState = ref.read(exportProvider);

    if (exportState.status == ExportStatus.success &&
        exportState.filePath != null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 6),
          backgroundColor: AppColors.incomeGreen,
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.white),
              const SizedBox(width: 12),
              const Expanded(child: Text('Export successful!')),
              TextButton(
                onPressed: () => notifier.shareFile(exportState.filePath!),
                child: const Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          action: SnackBarAction(
            label: 'Open',
            textColor: Colors.white,
            onPressed: () => notifier.openFile(exportState.filePath!),
          ),
        ),
      );
    } else if (exportState.status == ExportStatus.error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.expenseRed,
          content: Row(
            children: [
              const Icon(Icons.error_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(exportState.errorMessage ?? 'Export failed'),
              ),
            ],
          ),
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.white,
            onPressed: _handleExport,
          ),
        ),
      );
    }
  }
}
