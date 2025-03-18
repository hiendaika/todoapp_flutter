import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  bool isTaskCompleted = false;
  String taskName = '';
  Function(bool?)? onChanged;

  TodoItem({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        children: [
          Checkbox(
            value: isTaskCompleted,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              taskName,
              style: TextStyle(
                fontSize: 16,
                decoration: isTaskCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
