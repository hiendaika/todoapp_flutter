import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  bool isTaskCompleted = false;
  String taskName = '';
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;
  TodoItem({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          ),
        ],
      ),
      child: Padding(
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
                  decoration:
                      isTaskCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
