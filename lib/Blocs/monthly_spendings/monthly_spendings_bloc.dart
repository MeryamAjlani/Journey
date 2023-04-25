import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_journey/models/MonthlySpending.dart';

part 'monthly_spendings_event.dart';
part 'monthly_spendings_state.dart';

class MonthlySpendingsBloc
    extends Bloc<MonthlySpendingEntryEvent, MonthlySpendingsState> {
  MonthlySpendingsBloc() : super(MonthlySpendingsState()) {
    on<AddMonthlySpendingsEntry>(_onAddSpendingsEntry);
    on<UpdateMonthlySpendingsEntry>(_onUpdateSpendingsEntry);
    on<DeleteMonthlySpendingsEntry>(_onDeleteSpendingsEntry);
    on<DeleteAllMonthlySpendings>(_onDeleteAllSpendingsEntry);
  }

  FutureOr<void> _onAddSpendingsEntry(
      AddMonthlySpendingsEntry event, Emitter<MonthlySpendingsState> emit) {
    final state = this.state;
    //double total = spendings.fold(0, (sum, item) => sum + item.price);
    final monthlySpendings = state.monthlyFixedSpendings;
    final entry = event.entry;
    monthlySpendings!.add(entry);
    emit(MonthlySpendingsState(
        monthlyFixedSpendings: List.from(monthlySpendings),
        initialBudget: state.initialBudget,
        budgetLeft: state.budgetLeft));
  }

  FutureOr<void> _onUpdateSpendingsEntry(
      UpdateMonthlySpendingsEntry event, Emitter<MonthlySpendingsState> emit) {
    final state = this.state;
    final entry = event.entry;
    final budgetLeft;
    int index = state.monthlyFixedSpendings!.indexOf(entry);
    List<MonthlySpendingEntry> allSpendings =
        List.from(state.monthlyFixedSpendings!)..remove(entry);
    entry.isPaid == false
        ? {
            allSpendings.insert(index, entry.copyWith(isPaid: true)),
            budgetLeft = state.budgetLeft - entry.price
          }
        : {
            allSpendings.insert(index, entry.copyWith(isPaid: false)),
            budgetLeft = state.budgetLeft + entry.price
          };
    print(budgetLeft);
    emit(MonthlySpendingsState(
        monthlyFixedSpendings: List.from(allSpendings),
        budgetLeft: budgetLeft));
  }

  FutureOr<void> _onDeleteSpendingsEntry(
      DeleteMonthlySpendingsEntry event, Emitter<MonthlySpendingsState> emit) {
    final state = this.state;
    final entry = event.entry;
    emit(MonthlySpendingsState(
        monthlyFixedSpendings: List.from(state.monthlyFixedSpendings!)
          ..remove(entry),
        budgetLeft: state.budgetLeft));
  }

  // @override
  //MonthlySpendingsState? fromJson(Map<String, dynamic> json) {
  // return MonthlySpendingsState.fromMap(json);
  //}

  // @override
  // Map<String, dynamic>? toJson(MonthlySpendingsState state) {
  //  return state.toMap();
  // }

  FutureOr<void> _onDeleteAllSpendingsEntry(DeleteAllMonthlySpendings event,
      Emitter<MonthlySpendingsState> emit) async {
    emit(
      MonthlySpendingsState(
          monthlyFixedSpendings: const <MonthlySpendingEntry>[]),
    );
  }
}
