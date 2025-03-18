import 'package:flutter/material.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();
  List todoList = [
    ['Item 1', false],
    ['Item 2', false],
    ['Item 3', false],
  ];

  void handleCheckBox(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textEditController: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Center(
          child: Text('Todo App', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            taskName: todoList[index][0],
            isTaskCompleted: todoList[index][1],
            onChanged: (value) => handleCheckBox(value, index),
            onDelete: (context) {
              deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(),
        child: Icon(Icons.add),
      ),
    );
  }
}
