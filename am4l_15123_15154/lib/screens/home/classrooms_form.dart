import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/shared/constants.dart';

class ClassroomsForm extends StatefulWidget {
  @override
  _ClassroomsFormState createState() => _ClassroomsFormState();
}

class _ClassroomsFormState extends State<ClassroomsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> classrooms = ['1', '2', '3', '4', '5', '6'];

  // form values
  String _currentName;
  String _currentClassrooms;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your classrooms notices',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          // dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentClassrooms ?? '1',
            items: classrooms.map((classroom){
              return DropdownMenuItem(
                value: classroom,
                child: Text('$classroom'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentClassrooms = val),
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentClassrooms);
            },
          )
        ],),
    );
  }
}