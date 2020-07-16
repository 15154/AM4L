import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/models/classLabel.dart';
import 'package:am4l_15123_15154/models/notice.dart';
import 'package:am4l_15123_15154/screens/home/notice_list.dart';
import 'package:am4l_15123_15154/services/auth.dart';
import 'package:am4l_15123_15154/services/classServices.dart';
import 'package:am4l_15123_15154/services/noticeServices.dart';
import 'package:am4l_15123_15154/widgets/settings.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StreamProvider<List<ClassLabel>>.value(
              value: ClassService().classes,
              child: Scaffold(
                // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
                body: Settings(),
              ),
            );
          });
    }

    return StreamProvider<List<Notice>>.value(
      value: NoticeService().notices,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Schoolifications'),
          backgroundColor: Colors.red[300],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.directions_run),
                label: Text('Logout')),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: NoticeList(),
      ),
    );
  }
}