import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_view_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todo.dart';
import 'todo_list_store.dart';
import 'todo_input_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({ super.key });

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}


class _TodoListPageState extends State<TodoListPage> {
  final TodoListStore _store = TodoListStore();

  void _pushTodoInputPage([ Todo? todo ]) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TodoInputPage(todo: todo);
        },
      ),
    );

    setState(() { });
  }

  @override
  void initState() {
    super.initState();

    Future(
      () async {
        _store.load();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoリスト'),
      ),
      body: ListView.builder(
        itemCount: _store.count(),
        itemBuilder: (context, index) {
          var item = _store.findByIndex(index);
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    _pushTodoInputPage(item);
                  },
                  backgroundColor: Colors.orange,
                  icon: Icons.edit,
                  label: 'edit'
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25, 
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() => { _store.delete(item) });
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.edit,
                  label: 'delete'
                )
              ],
            ),
            child: ListViewItem(
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.pink),
              ),
              id: item.id,
              title: item.title,
              status: item.status,
              manageUser: "you",
              createDate: item.createDate,
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushTodoInputPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}