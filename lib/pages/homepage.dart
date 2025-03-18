import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();
  //reference the hivebox
  final _myBox = Hive.box('mybox');
  ToDoDatabase database = ToDoDatabase();
  // List todoList = [
  //   ['Item 1', false],
  //   ['Item 2', false],
  //   ['Item 3', false],
  // ];
  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
    super.initState();
  }

  void handleCheckBox(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    database.updateData();
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
      database.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    database.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updateData();
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
        itemCount: database.toDoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            taskName: database.toDoList[index][0],
            isTaskCompleted: database.toDoList[index][1],
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
