import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/models/notice.dart';

class NoticeList extends StatefulWidget {
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {

    final notices = Provider.of<List<Notice>>(context);
    notices.forEach((notice) {
      print(notice.name);
      print(notice.classrooms);
    });

    return Container(
      
    );
  }
}