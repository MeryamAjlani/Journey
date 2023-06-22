// ignore_for_file: prefer_typing_uninitialized_variables

part of 'budget_bloc.dart';

class BudgetState extends Equatable {
  final List<SpendingsEntry> allSpendings;
  final double total;
  final double initialBudget;
  final double budgetLeft;
  final List<MonthlySpendingEntry> monthlyFixedSpendings;

  const BudgetState(
      {this.allSpendings = const <SpendingsEntry>[],
      this.total = 0,
      this.initialBudget = 1200,
      this.budgetLeft = 1200,
      this.monthlyFixedSpendings= const <MonthlySpendingEntry>[]});

  @override
  List<Object> get props => [allSpendings, total, initialBudget,monthlyFixedSpendings];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allSpendings': allSpendings.map((x) => x.toMap()).toList(),
      'monthlySpendings': monthlyFixedSpendings.map((x) => x.toMap()).toList(),
    };
  }

  factory BudgetState.fromMap(Map<String, dynamic> map) {
    return BudgetState(
      allSpendings: List<SpendingsEntry>.from(
        (map['pendingTasks'])?.map<SpendingsEntry>(
          (x) => SpendingsEntry.fromMap(x),
        ),
      ),
    );
  }
}
