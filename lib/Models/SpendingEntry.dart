// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class SpendingsEntry extends Equatable {
  final String id;
  final String title;
  final double price;
  String? date;
  int? month;


  SpendingsEntry(
      {required this.id,
      required this.title,
      required this.price,
      this.month,
      this.date,}) {
    month = DateTime.now().month;

    DateTime today = DateTime.now();
    date = "${today.day}-${today.month}-${today.year}";
  }

  @override
  List<Object?> get props => [id, title, price];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'month': month
    };
  }

  SpendingsEntry copyWith({
    String? id,
    String? title,
    double? price,
  }) {
    return SpendingsEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        month: month ?? this.month,
        date: date ?? this.date);
  }

  factory SpendingsEntry.fromMap(Map<String, dynamic> map) {
    return SpendingsEntry(
        id: map['id'] as String,
        title: map['title'] as String,
        price: map['price'] as double,
        month: map['month'] as int);
  }
}
