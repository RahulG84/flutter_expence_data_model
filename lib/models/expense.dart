import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
//UUID (Universally Unique Identifier)

const uuid = Uuid();
final dateFormatter = DateFormat.yMMMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date; // DateTime is also class and type
  final Category category;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  @override
  String toString() {
    return 'ExpenseModel{id: $id, title: $title, amount: $amount, date: $date, category: $category}';
  }

  String formattedDate() {
    return dateFormatter.format(date);
  }
}
