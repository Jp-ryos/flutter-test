import 'package:flutter/material.dart';
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
  
  late bool _isCreateTodo;
  late String _title;
  late String _detail;
  late bool _isComplete;
  late String _createDate;
  late String _updateDate;

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;

    _title = todo?.title ?? "";
    _detail = todo?.detail ?? "";
    _isComplete = todo?.isComplete ?? false;
    _createDate = todo?.createDate ?? "";
    _updateDate = todo?.updateDate ?? "";
    _isCreateTodo = todo == null;
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
            CheckboxListTile(
              title: const Text('complete'),
              value: _isComplete, 
              onChanged: (bool? value) {
                setState(() {
                  _isComplete =  value ?? false;                  
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
            const TextField(
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
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_isCreateTodo) {
                    _store.add(_isComplete, _title, _detail);
                  } else {
                    _store.update(widget.todo!, _isComplete, _title, _detail);
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