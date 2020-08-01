import 'package:app1/Login_page.dart';
import 'package:app1/splah.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:app1/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:provider/provider.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Boom(),
      routes: {'home': (context) => Splash()},
    );
  }
}

class Boom extends StatefulWidget {
  static var tag;

  @override
  _BoomState createState() => _BoomState();
}

class _BoomState extends State<Boom> {
  String _userName;
  String _email;
  String _password;
  final GlobalKey<FormState> _formkey = GlobalKey<
      FormState>(); //using global key which is the standard way of using forms in flutter

  Widget _builduserName() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          labelText: 'userName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "userName is required";
          }
          return null;
        },
        onSaved: (String value) {
          _userName = value; // set the state
        });
  }

  Widget _buildemail() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'collinsbigomba8@gmail.com',
          labelText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 30,
        validator: (input) {
          if (input.isEmpty) {
            return "Email is required";
          }
          //if(!RegExp(^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$).hasMatch(value)) {
          //return 'please enter a valid Email';
          //}
          return null;
        },
        onSaved: (input) {
          _email = input; // set the state
        });
  }

  Widget _buildpassword() {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.phonelink_lock),
          labelText: 'password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        maxLength: 15,
        validator: (input) {
          if (input.isEmpty) {
            return "password is required";
          }
          return null;
        },
        onSaved: (input) {
          _password = input; // set the state
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: Form(
                    key: _formkey, //A MUST ADD
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 75,
                          child: Icon(
                            FontAwesomeIcons.university,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                        /*  Consumer<ThemeNotifier>(
                            builder:(context,notifier,child) => SwitchListTile(
                              title: Text('darkmode'),
                              
                              onChanged: (val){
                                notifier.toggleTheme();

                              },
                              value:notifier.darkTheme , 
                              )),*/
                        SizedBox(
                          height: 10,
                        ),
                        _builduserName(),
                        _buildemail(),
                        _buildpassword(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                               hoverColor: Colors.yellow,
                                color: Colors.orange,
                                elevation: 10,
                                child: Text(
                                  'SignIn',
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10))), //rounded edges of the button
                                onPressed: () {
                                  if (!_formkey.currentState.validate()) {
                                    //form to validate itself
                                    return;
                                  }
                                  _formkey.currentState
                                      .save(); // saves data entered and wenever the .save function is called, it  calls the onsaved method on each function

                                  print(_userName);
                                  print(_email);
                                  print(_password);
                                  //  signIn();
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _email, password: _password)
                                      .then((user) {
                                    // Navigator.of(context).pushReplacementNamed('/Boom');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Splash())); //gets u to the splash screen
                                  }).catchError((e) {
                                    print(e);
                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Splash())); //gets u to the splash screen
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RaisedButton(
                                hoverColor: Colors.yellow,
                                color: Colors.orange,
                                elevation: 10,
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10))), //rounded edges of the button
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Loginpage())); //gets u to the login page
                                }),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /* Future<void> signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            as FirebaseUser;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Splash())); //gets u to the splash screen

      } catch (e) {
        print(e.message);
      }
    }
  }
*/

}
