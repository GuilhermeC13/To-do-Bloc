import 'package:todo_bloc/layers/domain/entities/task_entity.dart';

class TaskController {
  List<TaskEntity> getTasksToDo() => [
        TaskEntity(
            title: 'Finalizar roteiro',
            type: TaskType.work,
            status: Status.toDo),
        TaskEntity(
            title: 'Arrumar escada',
            type: TaskType.personal,
            status: Status.toDo),
        TaskEntity(
            title: 'Cinema quarta', type: TaskType.fun, status: Status.toDo),
        TaskEntity(
            title: 'Pegar feedback', type: TaskType.work, status: Status.doing),
        TaskEntity(
            title: 'Arrumar geladeira',
            type: TaskType.personal,
            status: Status.doing),
        TaskEntity(
            title: 'Montar bonecos pokemon',
            type: TaskType.fun,
            status: Status.doing),
      ];
}
