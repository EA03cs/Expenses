import 'package:expenses/chart/chart.dart';
import 'package:expenses/widgets/addexpenses.dart';
import 'package:flutter/material.dart';
import 'expensesList/expenseslist.dart';
import 'models/expenses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> registeredExpenses = [
    Expense(
      category: Category.food,
      title: 'Pizza',
      amount: 32.99,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.work,
      title: 'APP for company',
      amount: 170.69,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.travel,
      title: 'Travel to dahab',
      amount: 90.23,
      date: DateTime.now(),
    ),
    Expense(
        category: Category.leisure,
        title: 'Buy FIFA24',
        amount: 80,
        date: DateTime.now())
  ];
  void addExpense (Expense expense){
    setState(() {
      registeredExpenses.add(expense);
    });
  }
  void removeExpense (Expense expense){
    setState(() {
      registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Expenses Tracker')),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => AddExpenses(onAddExpense: addExpense,),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
           Chart(expenses: registeredExpenses),
            Expanded(
              child: ExpensesList(registeredExpenses: registeredExpenses, onRemoveExpense: removeExpense,),
            ),
          ],
        ),
      ),
    );
  }
}
