import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_bloc/layers/domain/entities/task_entity.dart';
import 'package:todo_bloc/layers/presentation/ui/pages/bloc/bloc_imports.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<TaskEntity> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black12,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        var task = tasks[index];
        Color color;
        task.type == TaskType.work
            ? color = Colors.red
            : task.type == TaskType.personal
                ? color = Colors.green
                : color = Colors.yellow;
        return Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                onPressed: (_) {
                  context
                      .read<TasksBloc>()
                      .add(UpdateTask(taskEntity: task, status: Status.doing));
                },
                backgroundColor: const Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Editar',
              ),
              SlidableAction(
                onPressed: (_) {
                  context.read<TasksBloc>().add(DeleteTask(taskEntity: task));
                },
                backgroundColor: const Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Excluir',
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 20,
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                border: Border.all(color: color, width: 1.5),
                shape: BoxShape.circle,
              ),
            ),
            title: Text(task.title),
            horizontalTitleGap: -4,
          ),
        );
      }),
    );
  }
}
