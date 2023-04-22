import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_event.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_state.dart';
import 'package:my_journey/models/GroceryEntry.dart';

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_journey/models/GroceryEntry.dart';
import 'package:my_journey/models/GroceryEntry.dart';

class GroceriesBloc extends HydratedBloc<GroceriesEvent, GroceryState> {
  GroceriesBloc() : super(const GroceryState()) {
    on<AddGroceryEntry>(_onAddGroceryEntry);
    on<UpdateGroceryEntry>(_onUpdateGroceryEntry);
    on<DeleteGroceryEntry>(_onDeleteGroceryEntry);
    on<DeleteAllGroceries>(_onDeleteAllGroceryEntry);
  }

  FutureOr<void> _onAddGroceryEntry(
      AddGroceryEntry event, Emitter<GroceryState> emit) {
    final state = this.state;
    emit(GroceryState(
      allGroceries: List.from(state.allGroceries)..add(event.groceryEntry),
    ));
  }

  FutureOr<void> _onUpdateGroceryEntry(
      UpdateGroceryEntry event, Emitter<GroceryState> emit) {
    final state = this.state;
    final groceryEntry = event.groceryEntry;
    int index = state.allGroceries.indexOf(groceryEntry);
    List<GroceryEntry> allGroceries = List.from(state.allGroceries)
      ..remove(groceryEntry);
    groceryEntry.done
        ? allGroceries.insert(index,
            groceryEntry.copyWith(title: groceryEntry.title, done: false))
        : allGroceries.insert(index,
            groceryEntry.copyWith(title: groceryEntry.title, done: true));
    emit(GroceryState(allGroceries: List.from(allGroceries)));
  }

  FutureOr<void> _onDeleteGroceryEntry(
      DeleteGroceryEntry event, Emitter<GroceryState> emit) {
    final state = this.state;
    emit(GroceryState(
        allGroceries: List.from(state.allGroceries)
          ..remove(event.groceryEntry)));
  }

  @override
  Map<String, dynamic>? toJson(GroceryState state) {
    return state.toMap();
  }

  FutureOr<void> _onDeleteAllGroceryEntry(
      DeleteAllGroceries event, Emitter<GroceryState> emit) async {
    print('hello 1');
    var groceries = state.allGroceries;
    print('hello 2');
    if (groceries.isNotEmpty) {
      state.allGroceries.clear();
    }
    print('hello3');
    emit(
      const GroceryState(allGroceries: <GroceryEntry>[]),
    );
  }

  @override
  GroceryState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
