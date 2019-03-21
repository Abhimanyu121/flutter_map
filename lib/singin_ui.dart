import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'map_ui.dart';
class signin_ui extends StatelessWidget{
  var db =  Firestore.instance;
  var email = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home : _scaffold(context),
    );
  }
  Scaffold _scaffold (BuildContext context){
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
                      onPressed:  _sign_in(context),
                      child: Text("Sign-In"),
                  ),
                )
              ],
        )
        ),
      ),
    );
  }
  Future<void> _signin (BuildContext context )async {
    db.collection("users").where("email", isEqualTo: email.text).snapshots().listen((data) => data.documents.forEach((doc) async {
      if(doc["pass"] == pass.text){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('status',true);
        await prefs.setString("name",doc["name"]);
        await prefs.setString("email", doc["email"]);
        Navigator.push(context, 
        MaterialPageRoute(builder: (context)=> Mapui()));

      }
    }));
  }
  _sign_in(BuildContext context) async{
    await _signin(context);
  }



}
