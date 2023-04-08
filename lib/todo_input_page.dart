import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_status.dart';
import 'todo_list_store.dart';
import 'todo.dart';

class TodoInputPage extends StatefulWidget {
  final Todo? todo;

  const TodoInputPage({ super.key, this.todo });

  @override
  State<TodoInputPage> createState() => _TodoInputPageState();
}

class _TodoInputPageState extends State<TodoInputPage> {
  final TodoListStore _store = TodoListStore();
  final List<TodoStatus> _list = TodoStatus.values;
  
  late bool _isCreateTodo;
  late String _title;
  late String _detail;
  late bool _isComplete;
  late String _createDate;
  late String _updateDate;
  late String _status;

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;

print(todo?.status);
    _title = todo?.title ?? "";
    _detail = todo?.detail ?? "";
    _isComplete = todo?.isComplete ?? false;
    _createDate = todo?.createDate ?? "";
    _updateDate = todo?.updateDate ?? "";
    _isCreateTodo = todo == null;
    _status = todo?.status ?? TodoStatus.Todo.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isCreateTodo ? 'add Todo': 'edit Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            DropdownButton(
              items: _list.map<DropdownMenuItem<String>>((TodoStatus val) {
                  return DropdownMenuItem<String>(
                    value: val.name,
                    child: Text(val.name),
                  );
              }).toList(),
              value: _status,
              onChanged: (String? value) {
                setState(() {
                  _status = value!;
                  print("set Status $_status");
                });
              },
            ),
            
            const SizedBox(height: 20),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'title',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              controller: TextEditingController(text: _title),
              onChanged: (String value) {
                _title = value;
              },
            ),

            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              decoration: InputDecoration(
                labelText: "detail",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              controller: TextEditingController(text: _detail),
              onChanged: (String value) {
                _detail = value;
              }
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_isCreateTodo) {
                    _store.add(_isComplete, _title, _detail, _status);
                  } else {
                    _store.update(widget.todo!, _isComplete, _title, _detail, _status);
                    print("update Status $_status");
                  }
                  Navigator.of(context).pop();
                },
                child: Text (
                  _isCreateTodo ? 'add' : 'edit',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                child: const Text(
                  'cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text('createDate: $_createDate'),
            Text('updateDate: $_updateDate'),
          ],
        ),
      ),
    );
  }
}