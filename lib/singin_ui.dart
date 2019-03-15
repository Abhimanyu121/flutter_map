import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class signin_ui extends StatelessWidget{
  var email = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home : _scaffold(),
    );
  }
  Scaffold _scaffold (){
    return new Scaffold(
      appBar: AppBar(
        title: Text("Sign in "),
      ),
      body: new Container(
        child: new Form(
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new Container(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "email",
                      labelText: "Email"
                    ),
                    controller: email,
                  ),
                  padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                ),
                new Container(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                        hintText: "Password",
                        labelText: "Password"
                    ),
                    controller: pass,
                    obscureText: true,
                  ),
                  padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                ),
                new Container(
                  child: new RaisedButton(
                      onPressed: null,
                      child: Text("Sign-In"),
                  ),
                )
              ],
        )
        ),
      ),
    );
  }
  Register


}
