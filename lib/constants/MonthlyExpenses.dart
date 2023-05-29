import 'package:flutter/material.dart';
import 'package:my_journey/models/MonthlySpending.dart';

class MonthlySpendingSelected extends MonthlySpendingEntry {
  bool? isSelected;
  bool? isExpanded;

  MonthlySpendingSelected(
      {required String id,
      required String title,
      required double price,
      IconData? icon,
      this.isSelected = false,
      this.isExpanded=false})
      : super(id: id, title: title, price: price, icon: icon);
}

class MonthlyExpense {
  static final List<MonthlySpendingSelected> choiceList = [
    MonthlySpendingSelected(
        id: '1', title: 'Rent', price: 0, icon: Icons.house),
    MonthlySpendingSelected(
        id: '2', title: 'Transport', price: 0, icon: Icons.train),
    MonthlySpendingSelected(
        id: '3', title: 'Taxes', price: 0, icon: Icons.money_rounded),
    MonthlySpendingSelected(
        id: '4', title: 'Food', price: 0, icon: Icons.dining_sharp),
    MonthlySpendingSelected(
        id: '5', title: 'Bank Card', price: 0, icon: Icons.card_membership),
  ];
}
