import 'package:am4l_15123_15154/screens/wrapper.dart';
import 'package:am4l_15123_15154/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( //on peut utiliser le stream de user dans wrapper mnt
      value: AuthService().user, //quel type de value de stream on veut listen
        child: MaterialApp(
        home: Wrapper(), 
      ),
    );
  }
}

