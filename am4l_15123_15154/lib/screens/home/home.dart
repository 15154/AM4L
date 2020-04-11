import 'package:am4l_15123_15154/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/services/database.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/screens/home/notice_list.dart';
import 'package:am4l_15123_15154/models/notice.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Text('Bottom sheet'),
        );
      });
    }

    return StreamProvider<List<Notice>>.value(
        value: DatabaseService().notices,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Notices App'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settigns'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: NoticeList(),
      ),
    );
  }
}