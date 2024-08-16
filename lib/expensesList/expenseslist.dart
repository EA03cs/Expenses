import 'package:expenses/expensesList/expensesitem.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.registeredExpenses,
    required this.onRemoveExpense,
  });

  final List<Expense> registeredExpenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: registeredExpenses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(registeredExpenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(.7),
              margin: Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (direction) =>
                onRemoveExpense(registeredExpenses[index]),
            child:
                ExpensesItem(registeredExpenses: registeredExpenses[index])));
  }
}
