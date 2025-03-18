import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  //reference to box
  final _myBox = Hive.box('mybox');

  /// Run this function when the app starts.
  void createInitialData() {
    toDoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false]
    ];
  }

  /// Loads the data from the database.
  ///
  /// This method is used to load the data from the database. It should be
  /// called whenever the app starts.
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  /// Updates the data in the database.
  ///
  /// This method is used to update the data in the database. It should be
  /// called whenever the user changes the data.
  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}
