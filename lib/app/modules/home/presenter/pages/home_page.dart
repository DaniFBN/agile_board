import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_module/theme_module.dart';

import '../../domain/entities/task_entity.dart';
import '../controller/task_controller.dart';
import 'widgets/task_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.taskController,
  }) : super(key: key);

  final TaskController taskController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      widget.taskController.taskStore.loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Pattern - Meetup'),
        actions: [
          IconButton(
            icon: Icon(
              themeStore.isDark
                  ? Icons.mode_night_rounded
                  : Icons.wb_sunny_rounded,
            ),
            onPressed: () async {
              final newTheme = themeStore.isDark ? 0 : 1;
              await themeStore.changeTheme(newTheme);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ValueListenableBuilder(
          valueListenable: widget.taskController.taskStore.selectState,
          builder: (_, Set<TaskEntity> state, __) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (_, i) {
                final task = state.elementAt(i);
                return TaskCardWidget(
                  task: task,
                  onTapCheck: () =>
                      widget.taskController.taskStore.setCompleteTask(task),
                  onTapDelete: () =>
                      widget.taskController.taskStore.deleteTask(task),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.taskController.addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
