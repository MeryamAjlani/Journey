

import 'package:equatable/equatable.dart';
import 'package:my_journey/models/GroceryEntry.dart';

abstract class GroceriesEvent extends Equatable {
const GroceriesEvent();

  @override
  List<Object> get props => [];
}

class AddGroceryEntry extends GroceriesEvent {
  final GroceryEntry groceryEntry;

  const AddGroceryEntry({
    required this.groceryEntry,
  });

  @override
  List<Object> get props => [groceryEntry];
}

class UpdateGroceryEntry extends GroceriesEvent {
  final GroceryEntry groceryEntry;

  const UpdateGroceryEntry({
    required this.groceryEntry,
  });

  @override
  List<Object> get props => [groceryEntry];
}


class DeleteGroceryEntry extends GroceriesEvent {
  final GroceryEntry groceryEntry;

  const DeleteGroceryEntry({
    required this.groceryEntry,
  });

  @override
  List<Object> get props => [groceryEntry];
}


class DeleteAllGroceries extends GroceriesEvent {}