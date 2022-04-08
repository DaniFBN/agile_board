import 'package:flutter/material.dart';

import '../../../domain/entities/task_entity.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    Key? key,
    required this.task,
    required this.onTapDelete,
    required this.onTapCheck,
  }) : super(key: key);

  final TaskEntity task;
  final VoidCallback onTapDelete;
  final VoidCallback onTapCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTapCheck,
          icon: Icon(
            Icons.check,
            color: task.completed ? Colors.greenAccent[400] : Colors.redAccent,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title),
              Text(task.description),
            ],
          ),
        ),
        IconButton(
          onPressed: onTapDelete,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
