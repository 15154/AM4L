import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class NoticeList extends StatefulWidget {
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  @override
  Widget build(BuildContext context) {

    final notices = Provider.of<QuerySnapshot>(context);
    //print(notices.documents);
    for(var doc in notices.documents) {
      print(doc.data);
    }

    return Container(
      
    );
  }
}