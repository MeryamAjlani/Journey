import 'package:flutter/material.dart';
import 'package:my_journey/models/SpendingEntry.dart';

class MonthlySpendingEntry extends SpendingsEntry {
  IconData? icon;
  bool? isPaid;

  MonthlySpendingEntry(
      {required String id,
      required String title,
      required double price,
      this.isPaid,
      this.icon})
      : super(id: id, title: title, price: price) {
    isPaid = isPaid ?? false;
  }
  @override
  List<Object?> get props => [
        id,
        title,
        date,
        isPaid,
        icon,
      ];

  static fromMap(x) {}

  @override
  MonthlySpendingEntry copyWith({
    String? id,
    String? title,
    double? price,
    IconData? icon,
    bool? isPaid,
  }) {
  
    return MonthlySpendingEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        icon: icon ?? this.icon,
        isPaid: isPaid ?? this.isPaid);
  }

  // @override
  //factory MonthlySpendingEntry.fromMap(Map<String, dynamic> map) {
  //return MonthlySpendingEntry(
  //  id: map['id'] as String,
  //title: map['title'] as String,
  //price: map['price'] as double);
  //}
}
