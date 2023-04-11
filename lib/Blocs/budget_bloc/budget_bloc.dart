import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_journey/models/SpendingEntry.dart';

part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<SpendingsEntrysEvent, BudgetState> {
  BudgetBloc() : super(const BudgetState()) {
    on<AddSpendingsEntry>(_onAddSpendingsEntry);
    on<UpdateSpendingsEntry>(_onUpdateSpendingsEntry);
    on<DeleteSpendingsEntry>(_onDeleteSpendingsEntry);
    on<DeleteAllSpendingEntries>(_onDeleteAllSpendingsEntry);
  }

  FutureOr<void> _onAddSpendingsEntry(
      AddSpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    emit(BudgetState(
      allSpendings: List.from(state.allSpendings)..add(event.entry),
    ));
  }

  FutureOr<void> _onUpdateSpendingsEntry(
      UpdateSpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    final entry = event.entry;
    int index = state.allSpendings.indexOf(entry);
    List<SpendingsEntry> allSpendings = List.from(state.allSpendings)
      ..remove(SpendingsEntry);
    allSpendings.insert(
        index,
        entry.copyWith(
          price: entry.price,
          title: entry.title
        ));
    print(allSpendings);
    emit(BudgetState(allSpendings: List.from(allSpendings)));
  }

  FutureOr<void> _onDeleteSpendingsEntry(
      DeleteSpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    emit(BudgetState(
        allSpendings: List.from(state.allSpendings)
          ..remove(event.entry)));
  }

  @override
  BudgetState? fromJson(Map<String, dynamic> json) {
    return BudgetState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BudgetState state) {
    return state.toMap();
  }

  FutureOr<void> _onDeleteAllSpendingsEntry(
      DeleteAllSpendingEntries event, Emitter<BudgetState> emit) async {
    emit(
      BudgetState(allSpendings: const <SpendingsEntry>[]),
    );
  }
}
