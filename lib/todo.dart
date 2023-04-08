import 'package:flutter_application_1/todo_status.dart';

/// Todoモデルのクラス
///
/// 以下の責務を持つ
/// ・Todoのプロパティを持つ
class Todo {
  /// ID
  late int id;

  /// タイトル
  late String title;

  /// 詳細
  late String detail;

  /// 完了か
  late bool isComplete;

  /// 作成日時
  late String createDate;

  /// 更新日時
  late String updateDate;

  late String status;

  /// コンストラクタ
  Todo(
    this.id,
    this.title,
    this.detail,
    this.isComplete,
    this.createDate,
    this.updateDate,
    this.status
  );

  /// TodoモデルをMapに変換する(保存時に使用)
  Map toJson() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'isComplete': isComplete,
      'createDate': createDate,
      'updateDate': updateDate,
      'status': status
    };
  }

  /// MapをTodoモデルに変換する(読込時に使用)
  Todo.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    isComplete = json['isComplete'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    status = json['status'];
  }
}