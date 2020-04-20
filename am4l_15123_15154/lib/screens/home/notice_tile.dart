import 'package:am4l_15123_15154/screens/home/adListPage.dart';
import 'package:am4l_15123_15154/viewmodels/adListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/models/notice.dart';
import 'package:provider/provider.dart';

class NoticeTile extends StatelessWidget {

  final Notice notice;
  NoticeTile({ this.notice });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(notice.name),
          subtitle: Text('X unread notice(s)'), //to modify "new ad" instead of "X unread"
          leading: Icon(Icons.announcement),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('SUCCESSFULLY TAPPED');
            ChangeNotifierProvider(
              create: null,
              builder: (_) => AdListViewModel(),
              child: AdListPage(),
              );
            
          },
        ),
      )
    );
  }
}