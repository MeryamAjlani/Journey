part of '../monthly_spendings/monthly_spendings_bloc.dart';

class MonthlySpendingsState extends Equatable {
  final double initialBudget;
  final double budgetLeft;
  List<MonthlySpendingEntry>? monthlyFixedSpendings;

  MonthlySpendingsState(
      {this.initialBudget=1200,
      this.budgetLeft=1200,
      this.monthlyFixedSpendings}) { 
    monthlyFixedSpendings = monthlyFixedSpendings ?? [
      MonthlySpendingEntry(
          id: '4', title: 'Rent', price: 40.0, icon: Icons.house),
      MonthlySpendingEntry(
          id: '5', title: 'Rent', price: 40.0, icon: Icons.house),
      MonthlySpendingEntry(
          id: '7', title: 'Rent', price: 40.0, icon: Icons.house),
      MonthlySpendingEntry(
          id: 'i8', title: 'Rent', price: 40.0, icon: Icons.house)
    ];
  }

  @override
  List<Object> get props =>
      [initialBudget, budgetLeft, monthlyFixedSpendings!];

  // Map<String, dynamic> toMap() {
  // return <String, dynamic>{
  //  'allSpendings': monthlyFixedSpendings.map((x) => x.toMap()).toList(),
  // };
  // }

  //factory MonthlySpendingsState.fromMap(Map<String, dynamic> map) {
  //return MonthlySpendingsState(
  //monthlyFixedSpendings: List<MonthlySpendingEntry >.from(
  //(map['pendingTasks'])?.map<MonthlySpendingEntry >(
  //(x) => MonthlySpendingEntry .fromMap(x),
  // ),
  //),
  //);
  //}
}

class MonthlySpendingsInitial extends MonthlySpendingsState {}
