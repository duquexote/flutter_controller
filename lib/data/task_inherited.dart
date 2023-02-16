import 'package:flutter/material.dart';
import 'package:alura_flutter_curso_1/components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  List<Tasks> taskList = [
    const Tasks('Aprender Flutter', 'assets/images/flutter.png', 2),
    const Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    const Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    const Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    const Tasks('Jogar', 'assets/images/jogar.jpg', 0),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
