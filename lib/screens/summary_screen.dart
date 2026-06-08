import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/expense_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Food': return Colors.orange;
      case 'Transport': return Colors.blue;
      case 'Utilities': return Colors.amber;
      case 'Entertainment': return Colors.purple;
      case 'Health': return Colors.redAccent;
      default: return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, provider, child) {
        final breakdown = provider.categoryBreakdown;
        final total = provider.totalSpent;

        if (breakdown.isEmpty) {
          return const Center(child: Text('No expenses yet!'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Total Spent', style: Theme.of(context).textTheme.titleLarge),
              Text('\$${total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 32),
              Expanded(
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 60,
                    sections: breakdown.entries.map((entry) {
                      final percentage = (entry.value / total) * 100;
                      return PieChartSectionData(
                        color: _getCategoryColor(entry.key),
                        value: entry.value,
                        title: '${percentage.toStringAsFixed(1)}%',
                        radius: 60,
                        titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Legend
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: breakdown.keys.map((key) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 16, height: 16, color: _getCategoryColor(key)),
                      const SizedBox(width: 4),
                      Text('$key (\$${breakdown[key]!.toStringAsFixed(0)})'),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}