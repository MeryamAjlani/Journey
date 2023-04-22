import 'package:equatable/equatable.dart';
import 'package:my_journey/models/GroceryEntry.dart';

class GroceryState extends Equatable {
  final List<GroceryEntry> allGroceries;

  const GroceryState({this.allGroceries = const <GroceryEntry>[]});

  @override
  List<Object> get props => [
        allGroceries,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allGroceries': allGroceries.map((x) => x.toMap()).toList(),
    };
  }
}
