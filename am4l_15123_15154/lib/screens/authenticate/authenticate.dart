import 'package:am4l_15123_15154/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),
    );
  }
}
