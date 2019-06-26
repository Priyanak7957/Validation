import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'Screen2.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
 bool _validate = false;
  String name, email, mobile, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          // autovalidate: _validate,
          child: Card(
            elevation: 1.0,
            // color: Colors.white,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: validateName,
                    decoration: InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.text,
                    
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: validateEmail,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: validateMobile,
                    decoration: InputDecoration(labelText: 'Number'),
                    keyboardType: TextInputType.number,
                    
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Password is not valide';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    onSaved: (input) => password = input,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  // buttonColor: Colors.redAccent,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    child: Text(
                      "Pass Data to Statless",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  // buttonColor: Colors.redAccent,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen2,
                    child: Text(
                      "Pass Data to Statful",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(100.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
                name: name,
                mobile: mobile,
                email: email,
                password: password,
              ),
        ),
      );
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  _sendToNextScreen2() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen2(
                name: name,
                mobile: mobile,
                email: email,
                password: password,
              ),
        ),
      );
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
