class Task {
  String name;
  bool status;
  late DateTime date;
Task(this.name, {this.status = false}){
  this.date=DateTime.now();
}
  
}
