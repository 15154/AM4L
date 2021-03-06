import 'package:am4l_15123_15154/models/classLabel.dart';
import 'package:am4l_15123_15154/models/user.dart';
import 'package:am4l_15123_15154/services/userServices.dart';
import 'package:am4l_15123_15154/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/services/pushNotificationServices.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Set<String> _classLabels = Set<String>();
  List<String> _selectedClasses = List<String>();

  Map<String, bool> someMap = {};
  void _onClassesSelected(bool value, key) {
    if (value == true) {
      setState(() {
        someMap[key] = value;
        _selectedClasses.add(key);
        print(_selectedClasses);
      });
    } else {
      setState(() {
        someMap[key] = value;
        _selectedClasses.remove(key);
        print(_selectedClasses);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<ClassLabel>>(context);
    for (var clas in classes) {
      someMap.putIfAbsent(clas.uid, () => false);
      print(_classLabels);
      _classLabels.add(clas.uid);
    }

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: UserService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Add class(es)'),
                actions: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      await UserService(uid: user.uid)
                          .updateUserData(_selectedClasses ?? userData.classes);
                      PushNotificationService()
                          .unsubscribeFromSet(_classLabels);
                      PushNotificationService()
                          .subscribeToList(_selectedClasses);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.playlist_add),
                    color: Colors.red[300],
                    label: Text('Update'),
                  )
                ],
              ),
              body: ListView(
                children: someMap.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: someMap[key] ?? userData.classes,
                    onChanged: (bool value) {
                      setState(() {
                        _onClassesSelected(value, key);
                      });
                    },
                  );
                }).toList(),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
