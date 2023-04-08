import 'package:flutter_application_1/todo_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; 
import 'package:intl/intl.dart';
import 'todo.dart';

class TodoListStore {
  final String _key = 'TODO_N-';

  List<Todo> _list = [];

  static final TodoListStore _instance = TodoListStore._internal();

  TodoListStore._internal();

  factory TodoListStore() {
    return _instance;
  }

  int count () {
    return _list.length;
  }

  Todo findByIndex(int index) {
    return _list[index];
  }

  String getDateTime() {
    var format = DateFormat("yyyy/MM/dd HH:mm");
    var dateTime = format.format(DateTime.now());
    return dateTime;
  }

  void add(bool isComplete, String title, String detail) {
    var id = count() == 0 ? 1 : _list.last.id + 1;
    var dateTime = getDateTime();
    var todo = Todo(id, title, detail, isComplete, dateTime, dateTime, TodoStatus.Todo.name);
    _list.add(todo);
    save();
  }

  void update(Todo todo, bool isComplete, [String? title, String? detail, String? status]) {
    todo.isComplete = isComplete;

    if (title != null) {
      todo.title = title;
    } 
    if (detail != null) {
      todo.detail = detail;
    } 
    if (status != null) {
      todo.status = status;
    }

    todo.updateDate = getDateTime();
    save();
    print("save Status $status");
  }

  void delete(Todo todo) { 
    _list.remove(todo);
    save();
  }

  void save() async {
    var prefs = await SharedPreferences.getInstance();
    var saveTargetList = _list.map((a) => json.encode(a.toJson())).toList(); 
    prefs.setStringList(_key, saveTargetList); 
    print(saveTargetList);
  }

  void load() async {
    var prefs = await SharedPreferences.getInstance();
    var loadTargetList = prefs.getStringList(_key) ?? [];
    _list = loadTargetList.map((a) => Todo.fromJson(json.decode(a))).toList();
    print(loadTargetList);
  }
}