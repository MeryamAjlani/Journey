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
  List<Object> get props => [SpendingsEntry];
}

class UpdateSpendingsEntry extends SpendingsEntrysEvent {
  final SpendingsEntry entry;

  const UpdateSpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [SpendingsEntry];
}


class DeleteSpendingsEntry extends SpendingsEntrysEvent {
  final SpendingsEntry entry;

  const DeleteSpendingsEntry({
    required this.entry,
  });

  @override
  List<Object> get props => [SpendingsEntry];
}


class DeleteAllSpendingEntries extends SpendingsEntrysEvent {}