part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  final TaskEntity taskEntity;

  const AddTask({required this.taskEntity});

  @override
  List<Object> get props => [taskEntity];
}

class UpdateTask extends TasksEvent {
  final TaskEntity taskEntity;
  final Status status;

  const UpdateTask({required this.taskEntity, required this.status});

  @override
  List<Object> get props => [taskEntity];
}

class DeleteTask extends TasksEvent {
  final TaskEntity taskEntity;

  const DeleteTask({required this.taskEntity});

  @override
  List<Object> get props => [taskEntity];
}
