import 'package:am4l_15123_15154/screens/home/homePrincipal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/models/classLabel.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  final List<String> _selectedClasses = List<String>();
  final Map<String, bool> someMap = {};

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
    }

    return Scaffold(
      /*appBar: AppBar(
        title: Text('Add class'),
        backgroundColor: Colors.red[300],
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    var homePrincipal = HomePrincipal(valuee: _selectedClasses);
                    return homePrincipal;
                  }
                )
              );
            },
            icon: Icon(Icons.playlist_add),
            color: Colors.red[300],
            label: Text('Add'),
          )
        ],
      ),*/
      body: ListView(
        children: someMap.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: someMap[key],
            onChanged: (bool value) {
              setState(() {
                _onClassesSelected(value, key);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
