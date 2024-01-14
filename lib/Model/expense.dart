import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, grocery, cloth, movie, recharge }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.grocery: Icons.access_alarm_sharp,
  Category.cloth: Icons.shopping_bag_outlined,
  Category.movie: Icons.movie_filter,
  Category.recharge: Icons.receipt_sharp,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return formatter.format(date);
  }
}
