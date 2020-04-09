import 'package:am4l_15123_15154/screens/authenticate/authenticate.dart';
import 'package:am4l_15123_15154/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //return either Home or Authenticate widget
    return Authenticate();
      }
}