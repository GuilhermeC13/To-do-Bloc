part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskEntity> tasks;
  const TasksState({this.tasks = const <TaskEntity>[]});

  @override
  List<Object> get props => [tasks];
}

class TasksInitial extends TasksState {}

class TasksSuccessState extends TasksState {
  const TasksSuccessState({required List<TaskEntity> tasks})
      : super(
          tasks: tasks,
        );
}
