import 'package:flutter/material.dart';

class AddTaskFormWidget extends StatelessWidget {
  AddTaskFormWidget({
    Key? key,
    required this.onTapCreate,
  }) : super(key: key);

  final Future<void> Function({
    required String title,
    required String description,
  }) onTapCreate;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: titleController),
          const SizedBox(height: 20),
          TextField(controller: descriptionController),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onTapCreate(
                title: titleController.text,
                description: descriptionController.text,
              ).then((value) => Navigator.pop(context));
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
