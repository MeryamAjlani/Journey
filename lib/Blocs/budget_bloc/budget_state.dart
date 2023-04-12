// ignore_for_file: prefer_typing_uninitialized_variables

part of 'budget_bloc.dart';
 class BudgetState extends Equatable {
  final List<SpendingsEntry> allSpendings;
  final double total;

  const BudgetState({this.allSpendings = const <SpendingsEntry>[],this.total=0});

  @override
  List<Object> get props => [allSpendings,total];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allSpendings': allSpendings.map((x) => x.toMap()).toList(),
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
