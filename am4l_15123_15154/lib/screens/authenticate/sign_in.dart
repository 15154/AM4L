import 'package:am4l_15123_15154/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:am4l_15123_15154/shared/constants.dart';
import 'package:am4l_15123_15154/shared/loading.dart';
import 'register.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;

//text field state
String email = '';
String password = '';
String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0.0,
        title: Text('Sign in to Schoolifications'),
        /*actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register')),
        ],*/
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter a email please' : null,
                onChanged: (val){
                  setState(() => email = val );
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a valid password please, 6 char. min.' : null,
                obscureText: true, //hide the password
                onChanged: (val){
                  setState(() => password = val );
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red[600],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                  ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if( result == null){
                      setState(() {
                        error = 'could not sign in with those credentials';
                        loading = false;
                      });
                    }
                  }
                }),
                SizedBox(height: 12.0,),
                new GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                },
                child: new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new
                    Text.rich(
                      TextSpan(
                        text: "If you don't have an acount,\n please create one ",
                        style: TextStyle(color: Colors.red[600], fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'here',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          // can add more TextSpans here...
                        ],
                      ),
                    )
                  ) 
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
            ],
          ),
        ),
      ),
    );
  }
}