import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TodoStatus {
  Todo(name: 'Todo', color: Colors.black26),
  Under_Instabation(name: 'Under Instabation', color: Colors.black26),
  Inprogress(name: 'Inprogress', color: Colors.blue),
  Wating_Release(name: 'Wating Release', color: Colors.yellow),
  Testing(name: 'Testing', color: Colors.yellow),
  Done(name: 'Done', color: Colors.lightGreen),
  Canceled(name: 'Canceled', color: Colors.lightGreen);

  const TodoStatus({ required this.name, required this.color });

  final String name;
  final Color color;

  factory TodoStatus.toEnum(String val) {

    if (Todo.name == val) {
      return Todo;
    } else if (Under_Instabation.name == val) {
      return Under_Instabation;
    } else if (Inprogress.name == val) {
      return Inprogress;
    } else if (Wating_Release == val) {
      return Wating_Release;
    } else if (Testing.name == val) {
      return Testing;
    } else if (Done.name == val) {
      return Done;
    } else if (Canceled.name == val) {
      return Canceled;
    }

    throw ArgumentError('引数が不正です argment=$val');
  }
} 