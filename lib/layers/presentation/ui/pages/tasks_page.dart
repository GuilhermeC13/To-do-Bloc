// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:ion_flutter_ui_lib/widget/widgets_exports.dart';
import 'package:todo_bloc/layers/domain/entities/task_entity.dart';
import 'package:todo_bloc/layers/presentation/ui/widgets/tasks_list_widget.dart';

import 'bloc/bloc_imports.dart';

class TasksPage extends StatelessWidget {
  TasksPage({Key? key}) : super(key: key);

  final TextEditingController tituloController = TextEditingController();
  final GroupButtonController groupButtonController = GroupButtonController();

  void _addTask(BuildContext context) {
    Status statusAtual = Status.toDo;
    groupButtonController.selectIndex(0);
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              width: 50.0,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Adicionar Tarefa",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Título",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26))),
            ),
            const SizedBox(
              height: 24,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GroupButton(
              options: GroupButtonOptions(
                spacing: 24,
                borderRadius: BorderRadius.circular(16),
                unselectedColor: const Color.fromRGBO(230, 230, 230, 1),
                selectedColor: Colors.red.shade400,
              ),
              controller: groupButtonController,
              onSelected: (status, i, selected) {
                if (status == 'A fazer') {
                  statusAtual = Status.toDo;
                } else if (status == 'Em progresso') {
                  statusAtual = Status.doing;
                } else {
                  statusAtual = Status.done;
                }
              },
              buttons: const ['A fazer', 'Em progresso', 'Feito'],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (groupButtonController.selectedIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Diminuido com sucesso',
                        ),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else {
                    context.read<TasksBloc>().add(AddTask(
                        taskEntity: TaskEntity(
                            title: tituloController.text,
                            type: TaskType.fun,
                            status: statusAtual)));
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red.shade400),
                ),
                child: const Text('ADICIONAR'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskEntity> tasks = state.tasks;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: const Text(
              'Tarefas',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black87),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Stroke(
                  child: Text('Teste'),
                  width: 2,
                  contentPadding: EdgeInsets.all(8),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      'A fazer: 3',
                      textAlign: TextAlign.start,
                    ),
                    textColor: Colors.black87,
                    iconColor: Colors.black87,
                    children: [
                      TasksList(
                          tasks: tasks
                              .where((task) => task.status == Status.toDo)
                              .toList()),
                    ],
                  ),
                ),
                const Divider(),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      'Em progresso: 3',
                      textAlign: TextAlign.start,
                    ),
                    textColor: Colors.black87,
                    iconColor: Colors.black87,
                    children: [
                      TasksList(
                          tasks: tasks
                              .where((task) => task.status == Status.doing)
                              .toList()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
              // context.read<TasksBloc>().add(AddTask(
              //         taskEntity: TaskEntity(
              //       title: 'Teste',
              //       type: TaskType.personal,
              //       status: Status.toDo,
              //     )));
            },
            backgroundColor: Colors.red.shade400,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
