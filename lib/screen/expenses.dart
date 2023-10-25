import 'package:expence_data_model/models/expense.dart';
import 'package:expence_data_model/widget/custom_exp_list.dart';
import 'package:expence_data_model/widget/new_cstom_exp.darrt.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    List<ExpenseModel> myExpensesList = [
      ExpenseModel(
          title: "Flutter Development",
          amount: 20.98,
          date: DateTime.now(),
          category: Category.work),
    ];

    void addExpenses(ExpenseModel expenses) {
      print("Adding expense: $expenses");
      setState(() {
        myExpensesList.add(expenses);
      });
      print("Updated expenses list: $myExpensesList");
      print("Updated expenses list: ${myExpensesList.length}");
    }

    void openBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) => NewExpenses(onAddedExpenses: addExpenses),
      );
      print("Open bottom sheet is working");
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Expenses Tracker'),
          actions: [
            IconButton(
                onPressed: () => {
                      openBottomSheet(),
                    },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomExpensesList(expenses: myExpensesList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ...contactData
//     .map(
//       (item) => ListTile(
//         title: Text(item.name),
//         subtitle: Text(
//           item.number.toString(),
//         ),
//         leading: const Icon(Icons.person),
//         trailing: const Icon(Icons.star),
//         onTap: () => {},
//       ),
//     )
//     .toList(),
// Iterable<ListTile> to a list of Widget using the toList() method.
