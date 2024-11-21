import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return AlertDialog(
      title: Text("Add Task"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Task title"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              Provider.of<TaskProvider>(context, listen: false)
                  .addTask(controller.text);
              Navigator.of(context).pop();
            }
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
