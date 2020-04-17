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
  //tring _currentName;
  //String _currentClassrooms;

  bool _firstValue = false;
  bool _secValue = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Subscribe to classrooms',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          // dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            //value: _currentClassrooms ?? '1',
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool value) {

                      }, value: _firstValue,
                    ),
                    Text('1st year'),
                  ],
                ),
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool value) {
                      },
                      value: _secValue,
                    ),
                    Text('2nd year'),
                  ],
                ),
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool value) {
                      },
                      value: _secValue,
                    ),
                    Text('3rd year'),
                  ],
                ),
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool value) {
                      },
                      value: _secValue,
                    ),
                    Text('4th year'),
                  ],
                ),
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool value) {
                      },
                      value: _secValue,
                    ),
                    Text('5th year'),
                  ],
                ),
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool value) {
                      },
                      value: _secValue,
                    ),
                    Text('6th year'),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
            },
            hint: Text('Select a '),
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Subscribe',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_firstValue);
              print(_secValue);
            },
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           'Add a classroom',
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //         SizedBox(height: 20.0),
  //         // dropdown
  //         DropdownButtonFormField(
  //           decoration: textInputDecoration,
  //           value: _currentClassrooms ?? '1',
  //           items: classrooms.map((classroom){
  //             return DropdownMenuItem(
  //               value: classrooms,
  //               child: Text('$classrooms'),
  //             );
  //           }).toList(),
  //           onChanged: (val) => setState(() => _currentClassrooms = val),
  //         ),
  //         RaisedButton(
  //           color: Colors.pink[400],
  //           child: Text(
  //             'Add',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           onPressed: () async {
  //             print(_currentName);
  //             print(_currentClassrooms);
  //           },
  //         )
  //       ],
  //      ),
  //   );
  // }
}
