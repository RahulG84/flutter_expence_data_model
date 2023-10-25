import 'package:flutter/material.dart';

import '../models/expense.dart';

class NewExpenses extends StatefulWidget {
  void Function(ExpenseModel expenses) onAddedExpenses;

  NewExpenses({Key? key, required this.onAddedExpenses}) : super(key: key);

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  String enteredTitle = '';
  DateTime? selectedDate;
  Category selectedCategoryOption = Category.leisure;

  // void onSaveTitle(String inputValue) {
  //   enteredTitle = inputValue;
  // }

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void openDateTimePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final toSelectDateTime = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      selectedDate = toSelectDateTime;
    });
  }

  void submitExpenses() {
    final enteredAmount = double.tryParse(amountController.text);
    //TryParse--> its gives if user enter string like 'Hello' then its gives null and if user enter like '10.55' then its gives in double value like 10.55
    final invalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (titleController.text.trim().isEmpty ||
        invalidAmount ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.00)),
            title: const Text('Invalid Data!'),
            titleTextStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            content: const Text('Enter All Input Field..'),
            contentTextStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("OK!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
            ],
          );
        },
      );
      return;
    }

    final newExpense = ExpenseModel(
      title: titleController.text,
      amount: enteredAmount,
      date: selectedDate!,
      category: selectedCategoryOption,
    );
    widget.onAddedExpenses(newExpense);

    // widget.onAddedExpenses(
    //   ExpenseModel(
    //       title: titleController.text,
    //       amount: enteredAmount,
    //       date: selectedDate!,
    //       category: selectedCategoryOption),
    // );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }
  // when page is not rendering or its closed its disclose the TextEditingController

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.00),
      child: Column(
        children: [
          TextField(
            // onChanged: onSaveTitle,
            maxLength: 40,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            // onChanged: onSaveTitle,
            // maxLength: 40,
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: const InputDecoration(
              prefixText: '₹ ',
              label: Text("Amount"),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(selectedDate == null
                  ? 'Please Select Date'
                  : dateFormatter.format(selectedDate!)),
              IconButton(
                onPressed: openDateTimePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [x
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DropdownButton(
                  value: selectedCategoryOption,
                  // this value display the actual value selected from the menu item if u remove value then its shows blank
                  items: Category.values
                      .map(
                        (data) => DropdownMenuItem(
                          value: data,
                          // this value is not displaying to the user but these values are stored in the internally so that we get the value in the onchange function
                          child: Text(data.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    setState(() {
                      selectedCategoryOption = value!;
                    });
                  },
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  submitExpenses();
                  print(titleController.text);
                  print(amountController.text);
                  print(selectedDate);
                },
                child: const Text('Save Expenses'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
