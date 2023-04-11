part of 'budget_bloc.dart';
 class BudgetState extends Equatable {
  final List<SpendingsEntry> allSpendings;

  const BudgetState({this.allSpendings = const <SpendingsEntry>[]});

  @override
  List<Object> get props => [allSpendings];

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
