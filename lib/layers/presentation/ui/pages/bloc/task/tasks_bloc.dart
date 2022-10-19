import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/layers/domain/entities/task_entity.dart';
import 'package:todo_bloc/layers/presentation/controllers/task_controller.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TaskController controller = TaskController();
  TasksBloc() : super(const TasksState()) {
    on<LoadTasks>((event, emit) {
      emit(TasksSuccessState(tasks: controller.getTasksToDo()));
    });
    on<AddTask>((event, emit) {
      emit(TasksSuccessState(
        tasks: List.from(state.tasks)..add(event.taskEntity),
      ));
    });
    on<UpdateTask>((event, emit) {
      List<TaskEntity> tasks = List.from(state.tasks)..remove(event.taskEntity);
      tasks.add(event.taskEntity.copyWith(status: event.status));
      emit(TasksSuccessState(
        tasks: tasks,
      ));
    });
    on<DeleteTask>((event, emit) {
      emit(TasksSuccessState(
        tasks: List.from(state.tasks)..remove(event.taskEntity),
      ));
    });
  }
}
