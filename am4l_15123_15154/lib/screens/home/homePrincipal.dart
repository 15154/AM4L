import 'package:am4l_15123_15154/models/classLabel.dart';
import 'package:am4l_15123_15154/services/auth.dart';
import 'package:am4l_15123_15154/services/classServices.dart';
import 'package:am4l_15123_15154/services/noticeServices.dart';
import 'package:am4l_15123_15154/shared/constants.dart';
import 'package:am4l_15123_15154/widgets/class_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePrincipal extends StatefulWidget {
  List<String> valuee = List<String>();

  HomePrincipal({Key key, this.valuee}) : super(key: key);

  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _body = TextEditingController();
  final _title = TextEditingController();

  List<String> classes = List<String>();

  @override
  void dispose() {
    _body.dispose();
    _title.dispose();
    //_classes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _showAddClassesPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StreamProvider<List<ClassLabel>>.value(
              value: ClassService().classes,
              child: Scaffold(
                // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
                body: ClassList(),
              ),
            );
          });
    }

    return Scaffold(
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
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _title,
                    decoration: textInputDecoration.copyWith(hintText: 'Title'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _body,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Description'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    onPressed: () => _showAddClassesPanel(),
                    color: Colors.red[600],
                    child: Text('Add class(es)',
                                style: TextStyle(color: Colors.white),
                                )
                  ),
                ],
              )),
              RaisedButton(
                onPressed: () async {
                  var title = _title.text;
                  var body = _body.text;
                  classes = widget.valuee;
                  if (_formKey.currentState.validate()) {
                    print("${widget.valuee}");
                    await NoticeService()
                        .updateNoticeData(title, body, classes);
                    Navigator.pop(context);
                  }
                },
                color: Colors.red[600],
                child: Text('Add notice',
                            style: TextStyle(color: Colors.white),
                            )
              ),
            ]),
          )),
    );
  }
}
