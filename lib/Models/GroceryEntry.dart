class GroceryEntry {
  final String title;
  bool done;

  GroceryEntry({required this.title, this.done = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  GroceryEntry copyWith({
    String? title,
    bool? done
  }) {
    return GroceryEntry(
      title: title ?? this.title,
      done:  done ?? this.done
    );
  }
}
