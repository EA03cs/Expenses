// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


const uuid = Uuid();
final dateTime = DateFormat.yMMMd();

enum Category { food, travel, leisure, work }

const CategoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.leisure: Icons.games_sharp
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String formattedDate() {
    return dateTime.format(date);
  }

  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(List<Expense> allExpenses,this.category)
      : expenses = allExpenses.where((element) => element.category == category).toList();
  double get totalExpenses {
    double sum = 0;
    for (var ex in expenses) {
      sum = ex.amount + sum;
    }
    return sum;
  }
}
