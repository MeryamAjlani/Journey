part of 'budget_bloc.dart';

abstract class SpendingsEntrysEvent extends Equatable {
  const SpendingsEntrysEvent();

  @override
  List<Object> get props => [];
}

class AddSpendingsEntry extends SpendingsEntrysEvent {
  final SpendingsEntry entry;

  const AddSpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [entry];
}

class UpdateSpendingsEntry extends SpendingsEntrysEvent {
  final SpendingsEntry entry;

  const UpdateSpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [entry];
}


class DeleteSpendingsEntry extends SpendingsEntrysEvent {
  final SpendingsEntry entry;

  const DeleteSpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [entry];
}

class GetTotalBudgetSpentPerDay extends SpendingsEntrysEvent {
  final String date;

  const GetTotalBudgetSpentPerDay({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}



class DeleteAllSpendingEntries extends SpendingsEntrysEvent {}

class GetMonthlySpendings extends SpendingsEntrysEvent {
  final int month;

  const GetMonthlySpendings({
    required this.month,
  });

  @override
  List<Object> get props => [month];
}
