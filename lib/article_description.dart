import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_status.dart';

class ArticleDescription extends StatelessWidget {
  const ArticleDescription({
    super.key,
    required this.id,
    required this.title,
    required this.status,
    required this.manageUser,
    required this.createDate
  });

  final String id;
  final String title;
  final String status;
  final String manageUser;
  final String createDate;

  @override 
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                id,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: TodoStatus.toEnum(status).color)
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: TodoStatus.toEnum(status).color,
                    fontSize: 12.0
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                manageUser,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                createDate,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              )
            ],
          )
        ),
      ],
    );
  }
}