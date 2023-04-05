import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_journey/models/Task.dart';


part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<DeleteAllTasks>(_onDeleteAllTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completedTasks: state.completedTasks,
  
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;

    if (task.isDone == false) {
        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
    } else {       
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
    }
    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
     
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks..remove(event.task),
        completedTasks: state.completedTasks,
       
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }


  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }


  FutureOr<void> _onDeleteAllTask(
      DeleteAllTasks event, Emitter<TasksState> emit) async {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..clear(),
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
       
      ),
    );
  }
}