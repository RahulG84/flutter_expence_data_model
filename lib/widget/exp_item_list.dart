import 'package:expence_data_model/models/expense.dart';
import 'package:flutter/material.dart';

class CustomExpItemList extends StatelessWidget {
  final ExpenseModel expenses;

  const CustomExpItemList({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.00,
          vertical: 12.00,
        ),
        child: Column(
          children: [
            Text(expenses.title),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                // Text('\$ ${expenses.amount.toStringAsFixed(2)}'),
                Text('₹ ${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
                    const SizedBox(width: 10),
                    Text(expenses.formattedDate()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
