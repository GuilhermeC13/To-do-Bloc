import 'package:flutter/material.dart';
import 'package:todo_bloc/layers/presentation/ui/pages/tasks_page.dart';

import 'layers/presentation/ui/pages/bloc/bloc_imports.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: BlocProvider(
        create: (context) => TasksBloc()..add(LoadTasks()),
        child: TasksPage(),
      ),
    );
  }
}
