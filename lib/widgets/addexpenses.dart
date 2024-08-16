import 'package:expenses/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  TextEditingController titleController = TextEditingController();
  final amountController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  Category selectedCategory = Category.food;
  final formater = DateFormat.yMd();
  DateTime? selectedDate;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    amountController.dispose();
    dataController.dispose();
  }

// void saveTitle (String inputValue){
//   setState(() {
//     title = inputValue;
//     print(title);
//   });
// }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$',
            ),
          ),
          TextFormField(
              keyboardType: TextInputType.datetime,
              onTap: () async {
                final DateTime? pickDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse('2024-05-03'),
                );
                setState(() {
                  selectedDate = pickDate;
                });
              },
              controller: dataController,
              decoration: InputDecoration(
                label: Text(
                  selectedDate == null
                      ? 'No Date Selected'
                      : DateFormat.yMd().format(selectedDate!),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    final double? entreAmount =
                        double.tryParse(amountController.text);
                    final bool amountIsInValid =
                        entreAmount == null || entreAmount <= 0;
                    if (titleController.text.trim().isEmpty ||
                        amountIsInValid ||
                        selectedDate == null) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Invalid Data'),
                          content: const Text('Wrong Input'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Text('OK'),
                            )
                          ],
                        ),
                      );
                    } else {
                      widget.onAddExpense(
                        Expense(
                            category: selectedCategory,
                            title: titleController.text,
                            amount: entreAmount,
                            date: selectedDate!),
                      );
                      Navigator.pop(context);
                    }
                  });
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
