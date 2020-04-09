import 'package:am4l_15123_15154/screens/authenticate/authenticate.dart';
import 'package:am4l_15123_15154/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    //return either Home or Authenticate widget
    return Authenticate();
  }
}