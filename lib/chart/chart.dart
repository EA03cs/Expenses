// ignore_for_file: non_constant_identifier_names

import 'package:expenses/chart/chart%20bar.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

class Chart extends StatelessWidget {
  const Chart(
      {super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  get maxTotal {
    double maxTotal = 0;
    for (var elemant in buckets) {
      if (elemant.totalExpenses > maxTotal) {
        maxTotal = elemant.totalExpenses;
      }
    }
    return maxTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(.3),
              Theme.of(context).colorScheme.primary.withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final ele in buckets)
                  ChartBar(fill: ele.totalExpenses==0?0:ele.totalExpenses/maxTotal,)
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: buckets
                .map((e) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        CategoryIcon[e.category],
                        color: Theme.of(context).colorScheme.primary.withOpacity(.7),
                      ),
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}
