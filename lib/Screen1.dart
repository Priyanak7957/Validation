import 'package:flutter/material.dart';
import 'SignUpPage.dart';

class HomePage extends StatelessWidget {
  final String name, email, mobile, password;

  HomePage(
      {Key key, @required this.name, this.email, this.mobile, this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Statless Page"),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
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
                leading: Icon(Icons.people),
                title: Text(name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(email),
              )
            ],
          ),
        ),
      ),
    );
  }
}
