import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/models/notice.dart';

class NoticeTile extends StatelessWidget {
  final Notice notice;
  NoticeTile({this.notice});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: Text("1A"),
            title: Text(notice.title),
            subtitle: Text(notice.body),
          ),
        )
    );
  }
}
