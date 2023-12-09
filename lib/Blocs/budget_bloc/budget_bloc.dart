import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_journey/models/MonthlySpending.dart';
import 'package:my_journey/models/SpendingEntry.dart';

part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<SpendingsEntrysEvent, BudgetState> {
  BudgetBloc() : super(BudgetState()) {
    on<AddSpendingsEntry>(_onAddSpendingsEntry);
    on<UpdateSpendingsEntry>(_onUpdateSpendingsEntry);
    on<DeleteSpendingsEntry>(_onDeleteSpendingsEntry);
    on<DeleteAllSpendingEntries>(_onDeleteAllSpendingsEntry);

    on<AddMonthlySpendingsEntry>(_onAddMonthlySpendingsEntry);
    on<UpdateMonthlySpendingsEntry>(_onUpdateMonthlySpendingsEntry);
    on<DeleteMonthlySpendingsEntry>(_onDeleteMonthlySpendingsEntry);

  }

  FutureOr<void> _onAddSpendingsEntry(
      AddSpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    //double total = spendings.fold(0, (sum, item) => sum + item.price);
    double total = event.entry.price + state.total;
    final moneyleft = state.initialBudget - state.total;
    emit(BudgetState(
        allSpendings: List.from(state.allSpendings)..add(event.entry),
        total: total,
        budgetLeft: moneyleft));
  }

  FutureOr<void> _onUpdateSpendingsEntry(
      UpdateSpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    final entry = event.entry;
    int index = state.allSpendings.indexOf(entry);
    List<SpendingsEntry> allSpendings = List.from(state.allSpendings)
      ..remove(SpendingsEntry);
    allSpendings.insert(
        index, entry.copyWith(price: entry.price, title: entry.title));
    emit(BudgetState(allSpendings: List.from(allSpendings)));
  }

  FutureOr<void> _onDeleteSpendingsEntry(
      DeleteSpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    final entry = event.entry;
    final total = state.total - entry.price;
    final moneyleft = state.initialBudget - total;
    emit(BudgetState(
        allSpendings: List.from(state.allSpendings)..remove(entry),
        total: total,
        budgetLeft: moneyleft));
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

  FutureOr<void> _onAddMonthlySpendingsEntry(
      AddMonthlySpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    final entry = event.entry;
    //double total = spendings.fold(0, (sum, item) => sum + item.price);
    //double total = event.entry.price + state.total;
    //final moneyleft = state.initialBudget - state.total;
    emit(BudgetState(
        monthlyFixedSpendings: List.from(state.monthlyFixedSpendings)
          ..add(entry),
        total: state.total,
        budgetLeft: state.budgetLeft));
  }

  FutureOr<void> _onUpdateMonthlySpendingsEntry(
      UpdateMonthlySpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    final entry = event.entry;
    int index = state.allSpendings.indexOf(entry);
    List<SpendingsEntry> allSpendings = List.from(state.allSpendings)
      ..remove(SpendingsEntry);
    allSpendings.insert(
        index, entry.copyWith(price: entry.price, title: entry.title));
    emit(BudgetState(allSpendings: List.from(allSpendings)));
  }

  FutureOr<void> _onDeleteMonthlySpendingsEntry(
      DeleteMonthlySpendingsEntry event, Emitter<BudgetState> emit) {
    final state = this.state;
    final entry = event.entry;
    final total = state.total - entry.price;
    final moneyleft = state.initialBudget - total;
    emit(BudgetState(
        monthlyFixedSpendings: List.from(state. monthlyFixedSpendings)..remove(entry),
        total: total,
        budgetLeft: moneyleft));
  }
}
