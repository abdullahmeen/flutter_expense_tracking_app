import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  // Get expenses sorted by date (most recent first)
  List<Expense> get expenses {
    List<Expense> sortedList = [..._expenses];
    sortedList.sort((a, b) => b.date.compareTo(a.date));
    return sortedList;
  }

  // Calculate total amount spent
  double get totalSpent {
    return _expenses.fold(0.0, (sum, item) => sum + item.amount);
  }

  // Generate category-wise breakdown for the chart
  Map<String, double> get categoryBreakdown {
    Map<String, double> breakdown = {};
    for (var expense in _expenses) {
      if (breakdown.containsKey(expense.category)) {
        breakdown[expense.category] = breakdown[expense.category]! + expense.amount;
      } else {
        breakdown[expense.category] = expense.amount;
      }
    }
    return breakdown;
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void updateExpense(Expense updatedExpense) {
    final index = _expenses.indexWhere((e) => e.id == updatedExpense.id);
    if (index >= 0) {
      _expenses[index] = updatedExpense;
      notifyListeners();
    }
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}