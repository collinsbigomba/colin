import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

Color firstcolor = Color(0xFFF47015);
Color secondcolor = Color(0xFFEF7727C); //gradient of colors

class Contacts extends StatefulWidget {
  static var tag;

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  String _names;
  String _email;
  String _password;
  String _phoneNumber;

  final GlobalKey<FormState> _formkey = GlobalKey<
      FormState>(); //using global key which is the standard way of using forms in flutter

  Widget _buildnames() {
    //functions that return widgets
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.person_outline),
          labelText: 'names',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
        maxLength: 16,
        validator: (String value) {
          if (value.isEmpty) {
            return "Full names are required";
          }
          return null;
        },
        onSaved: (String value) {
          _names = value; // set the state
        });
  }

  Widget _buildemail() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
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
        decoration: InputDecoration(
          icon: Icon(Icons.phonelink_lock),
          labelText: 'password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
        maxLength: 14,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
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
        decoration: InputDecoration(
          icon: Icon(Icons.phonelink_ring),
          labelText: 'phoneNumber',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
        maxLength: 10,
        keyboardType: TextInputType.phone,
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
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Login Form'),
        backgroundColorStart: Color(0xFFF47015), //appbar color
        backgroundColorEnd: Color(0xFFEF7727C),
      ),
      body: Container(
        child: Center(
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
                        _buildnames(),
                        _buildemail(),
                        _buildpassword(),
                        _buildphoneNumber(),

                        //SizedBox(height:40),  //create space

                        Builder(
                          //shows the snackbar
                          builder: (context) => RaisedButton(
                             hoverColor: Colors.yellow,
                              child: Text(
                                'submit',
                                style: TextStyle(fontSize: 18),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          10))), //rounded edges of the button
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.orange,
                                    content: Text(
                                        'Submitting Form, Please Wait.....')));
                                if (!_formkey.currentState.validate()) {
                                  //form to validate itself
                                  return;
                                }
                                _formkey.currentState
                                    .save(); // saves data entered and wenever the .save function is called, it  calls the onsaved method on each function

                                print(_names);
                                print(_email);
                                print(_password);
                                print(_phoneNumber);
                              }),
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
}
