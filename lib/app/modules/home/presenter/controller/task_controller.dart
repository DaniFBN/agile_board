import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

import '../pages/widgets/add_task_form_widget.dart';
import '../stores/task_store.dart';

class TaskController {
  const TaskController({
    required this.taskStore,
  });

  final TaskStore taskStore;

  Future<void> addTask() async {
    await asuka.showModalBottomSheet<Widget>(
      builder: (context) {
        return AddTaskFormWidget(onTapCreate: taskStore.addTask);
      },
    );
  }
}
