import 'package:flutter/material.dart';
import 'article_description.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.thumbnail,
    required this.id,
    required this.title,
    required this.status,
    required this.manageUser,
    required this.createDate,
  });

  final Widget thumbnail;
  final String id;
  final String title;
  final String status;
  final String manageUser;  
  final String createDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 2.0),
                child: ArticleDescription(
                  id: id,
                  title: title,
                  status: status,
                  manageUser: manageUser,
                  createDate: createDate,
                )
              ),
            ),
          ],
        )
      ),
    );
  }
}