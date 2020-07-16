import 'package:am4l_15123_15154/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

bool showSignIn = true;
void toggleView(){
  setState(() => showSignIn = !showSignIn);
}

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView); //toggleView: toggleView permet d'utiliser la fct dans les Widgets ds les views
    } else{
      return Register(toggleView: toggleView);
    }
  }
}
