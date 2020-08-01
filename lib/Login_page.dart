import 'package:app1/services.dart';
import 'package:app1/splah.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginpage(),
      routes: {'home': (context) => Splash()},
    );
  }
}

class Loginpage extends StatefulWidget {
  static var tag;

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _phoneNumber;

  final GlobalKey<FormState> _formkey = GlobalKey<
      FormState>(); //using global key which is the standard way of using forms in flutter

  Widget _buildfirstName() {
    //functions that return widgets
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          labelText: 'FirstName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "FirstName is required";
          }
          return null;
        },
        onSaved: (String value) {
          _firstName = value; // set the state
        });
  }

  Widget _buildlastName() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          labelText: 'lastName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "lastName is required";
          }
          return null;
        },
        onSaved: (String value) {
          _lastName = value; // set the state
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
        validator: (String value) {
          if (value.isEmpty) {
            return "Email is required";
          }
          //if(!RegExp(^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$).hasMatch(value)) {
          //return 'please enter a valid Email';
          //}
          return null;
        },
        onSaved: (String value) {
          _email = value; // set the state
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
        validator: (String value) {
          if (value.isEmpty) {
            return "password is required";
          }
          return null;
        },
        onSaved: (String value) {
          _password = value; // set the state
        });
  }

  Widget _buildphoneNumber() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          labelText: 'phoneNumber',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return "phonenumber is required";
          }
          return null;
        },
        onSaved: (String value) {
          _phoneNumber = value; // set the state
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            //to prevent screen size issues
            child: Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: Form(
                    key: _formkey, //A MUST ADD
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //center the form
                      children: <Widget>[
                        //add in the functions created from the widget

                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 75,
                          child: Icon(
                            FontAwesomeIcons.university,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildfirstName(),
                        _buildlastName(),
                        _buildemail(),
                        _buildpassword(),
                        _buildphoneNumber(),

                        RaisedButton(
                            hoverColor: Colors.yellow,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            elevation: 5,
                            child: Text(
                              'submit',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 19),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10))), //rounded edges of the button
                            onPressed: () {
                              if (!_formkey.currentState.validate()) {
                                //form to validate itself
                                return;
                              }
                              _formkey.currentState
                                  .save(); // saves data entered and wenever the .save function is called, it  calls the onsaved method on each function

                              print(_firstName);
                              print(_lastName);
                              print(_email);
                              print(_password);
                              print(_phoneNumber);
                              //signUp();
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((signedInUser) {
                                UserManagement()
                                    .storeNewUser(signedInUser, context);
                              }).catchError((e) {
                                print(e);
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Splash())); //gets u to the splash screen
                            }),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
  /* Future<void> signUp() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
                user.sendEmailVerification();

        
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Splash())); //gets u to the splash screen

      } catch (e) {
        print(e.message);
      }
    }
  }*/
}
