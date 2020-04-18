import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/shared/constants.dart';

class ClassroomsForm extends StatefulWidget {
  @override
  _ClassroomsFormState createState() => _ClassroomsFormState();
}

class _ClassroomsFormState extends State<ClassroomsForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  bool _1Val = true;
  bool _2Val = true;
  bool _3Val = true;
  bool _4Val = true;
  bool _5Val = true;
  bool _6Val = true;

  /// box widget
  /// [title] is the name of the checkbox
  /// [boolValue] is the boolean value of the checkbox
  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "1st year":
                  _1Val = value;
                  break;
                case "2nd year":
                  _2Val = value;
                  break;
                case "3rd year":
                  _3Val = value;
                  break;
                case "4th year":
                  _4Val = value;
                  break;
                case "5th year":
                  _5Val = value;
                  break;
                case "6th year":
                  _6Val = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              checkbox("1st year", _1Val),
              checkbox("2nd year", _2Val),
              checkbox("3rd year", _3Val),
              checkbox("4th year", _4Val),
              checkbox("5th year", _5Val),
              checkbox("6th year", _6Val),
            ],
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Subscribe',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              //print(_firstValue);
              //print(_secValue);
              if (_formKey.currentState.validate()) {
                Navigator.pop(context);
              }
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
  //           'Subscribe to classrooms',
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //         SizedBox(height: 20.0),
  //         // dropdown
  //         DropdownButtonFormField(
  //           decoration: textInputDecoration,
  //           //value: _currentClassrooms ?? '1',
  //           items: [
  //             DropdownMenuItem(
  //               child: Row(
  //                 children: <Widget>[
  //                   Checkbox(
  //                     onChanged: (bool value) {

  //                     }, value: _firstValue,
  //                   ),
  //                   Text('1st year'),
  //                 ],
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               child: Row(
  //                 children: <Widget>[
  //                   Checkbox(
  //                     onChanged: (bool value) {
  //                     },
  //                     value: _secValue,
  //                   ),
  //                   Text('2nd year'),
  //                 ],
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               child: Row(
  //                 children: <Widget>[
  //                   Checkbox(
  //                     onChanged: (bool value) {
  //                     },
  //                     value: _secValue,
  //                   ),
  //                   Text('3rd year'),
  //                 ],
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               child: Row(
  //                 children: <Widget>[
  //                   Checkbox(
  //                     onChanged: (bool value) {
  //                     },
  //                     value: _secValue,
  //                   ),
  //                   Text('4th year'),
  //                 ],
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               child: Row(
  //                 children: <Widget>[
  //                   Checkbox(
  //                     onChanged: (bool value) {
  //                     },
  //                     value: _secValue,
  //                   ),
  //                   Text('5th year'),
  //                 ],
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               child: Row(
  //                 children: <Widget>[
  //                   Checkbox(
  //                     onChanged: (bool value) {
  //                     },
  //                     value: _secValue,
  //                   ),
  //                   Text('6th year'),
  //                 ],
  //               ),
  //             ),
  //           ],
  //           onChanged: (value) {
  //           },
  //           hint: Text('Select a '),
  //         ),
  //         RaisedButton(
  //           color: Colors.pink[400],
  //           child: Text(
  //             'Subscribe',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           onPressed: () async {
  //             print(_firstValue);
  //             print(_secValue);
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
