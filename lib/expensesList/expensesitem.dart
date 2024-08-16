import 'package:flutter/material.dart';

import '../models/expenses.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.registeredExpenses});
  final Expense registeredExpenses;

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(registeredExpenses.title,style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 4,),
          Row(
            children: [
              Text('\$${registeredExpenses.amount.toString()}',style: const TextStyle(fontWeight: FontWeight.bold),),
              const Spacer(),
              Row(
                children: [
                   Icon(CategoryIcon[registeredExpenses.category]),
                  Text(registeredExpenses.formattedDate(),style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ],

          ),
        ],
      ),
    ));
  }
}
