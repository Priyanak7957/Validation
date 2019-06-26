import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String name, email, mobile, password;

  const Screen2({
    Key key,
    this.name,
    this.email,
    this.mobile,
    this.password,
  }) : super(key: key);

  _Screen2State createState() => _Screen2State(name : this.name, email : this.email );
}

class _Screen2State extends State<Screen2> {
   final String name, email ;

  _Screen2State({this.name, this.email });

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Statful Page"),
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
