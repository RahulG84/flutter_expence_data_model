import 'package:expence_data_model/widget/exp_item_list.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

// class CustomExpensesList extends StatelessWidget {
//   final List<ExpenseModel> expenses;
//
//   const CustomExpensesList({Key? key, required this.expenses})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: expenses.length,
//       itemBuilder: (ctx, index) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.00),
//         child: (CustomExpItemList(
//           expenses: expenses[index],
//         )),
//       ),
//     );
//   }
// }

class CustomExpensesList extends StatefulWidget {
  final List<ExpenseModel> expenses;
  const CustomExpensesList({Key? key, required this.expenses})
      : super(key: key);

  @override
  State<CustomExpensesList> createState() => _CustomExpensesListState();
}

class _CustomExpensesListState extends State<CustomExpensesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (context, index) {
        final item = widget.expenses[index];
        return Card(
          child: ListTile(
            leading: Text(item.amount.toString()),
            trailing: Text(item.date.toString()),
            title: Text(item.title),
          ),
        );
      },
    );
  }
}

////expenses
