import 'package:flutter/foundation.dart';

enum TodoStatus {
  Todo(name: 'Todo'),
  Under_Instabation(name: 'Under Instabation'),
  Inprogress(name: 'Inprogress'),
  Wating_Release(name: 'Wating Release'),
  Testing(name: 'Testing'),
  Done(name: 'Done'),
  Canceled(name: 'Canceled');

  const TodoStatus({ required this.name});

  final String name;

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