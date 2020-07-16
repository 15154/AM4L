import 'package:am4l_15123_15154/screens/authenticate/authenticate.dart';
import 'package:am4l_15123_15154/screens/home/home.dart';
import 'package:am4l_15123_15154/screens/home/homePrincipal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:am4l_15123_15154/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); //our accessing the user data from the provider, we specify what type de data we need <User>
    //print(user);
    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else if (user.uid == 'A0WKRX92LCb7RLnh31jAZqOLaNy1') {
      return HomePrincipal();
    } else {
      return Home();
    }
  }
}