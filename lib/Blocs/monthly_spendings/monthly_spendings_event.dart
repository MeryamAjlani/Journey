part of 'monthly_spendings_bloc.dart';


abstract class MonthlySpendingEntryEvent extends Equatable {
  const MonthlySpendingEntryEvent();

  @override
  List<Object> get props => [];
}

class AddMonthlySpendingsEntry extends MonthlySpendingEntryEvent {
  final MonthlySpendingEntry entry;

  const AddMonthlySpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [entry];
}

class UpdateMonthlySpendingsEntry extends MonthlySpendingEntryEvent {
  final MonthlySpendingEntry entry;

  const UpdateMonthlySpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [entry];
}


class DeleteMonthlySpendingsEntry extends MonthlySpendingEntryEvent {
  final MonthlySpendingEntry entry;

  const DeleteMonthlySpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [entry];
}

class GetTotalBudgetSpentPerDay extends MonthlySpendingEntryEvent {
  final String date;

  const GetTotalBudgetSpentPerDay({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}



class DeleteAllMonthlySpendings extends MonthlySpendingEntryEvent {}

class GetMonthlySpendings extends MonthlySpendingEntryEvent {
  final int month;

  const GetMonthlySpendings({
    required this.month,
  });

  @override
  List<Object> get props => [month];
}
