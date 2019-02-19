import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Roundedbutton.dart';
class register_ui extends StatelessWidget{

  BuildContext cx;
  String userName;
  String email;
  String password;
  bool pool;
  String ph_no;

  @override

  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;

      _register() async {
       await  _register_event(email, ph_no,userName, pool, password);
      }

    // TODO: implement build
    return new MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text("Register at Magicarp"),
        ),
        body: new Container(
            child: new Form(
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    new Container(
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name',
                          icon: new Icon(Icons.person),
                        ),
                        onSaved : (String value) {userName = value;},
                      ),
                      padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                    ),
                    new Container(
                      child: new Container(
                        child: new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'EmailID',
                            labelText: 'EmailID',
                          ),
                          onSaved: (String value) { email = value; },
                        ),
                        padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                      ),
                      padding: const EdgeInsets.only(top:10.0),
                    ),
                    new Container(
                      child: new Container(
                        child: new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Phone number',
                            labelText: 'Phone Number',
                          ),
                          onSaved: (String value) { ph_no = value; },
                        ),
                        padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                      ),
                      padding: const EdgeInsets.only(top:10.0),
                    ),
                    new Container(
                      child: new Container(
                        child: new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Type your password here',
                            labelText: 'Password *',
                          ),
                          obscureText: true,
                          onSaved: (String value) { password=value;
                          },
                        ),
                        padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                      ),
                      padding: const EdgeInsets.only(top:10.0),
                    ),
                    new Container(
                      child: new Container(
                        child:new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Repeat Password',
                            labelText: 'Retype-Password *',
                          ),
                          obscureText: true,
                        ),
                        padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                      ),
                      padding: const EdgeInsets.only(top:10.0),
                    ),
                    new Container(
                        child : new Text("Do you have vehicle to pool?")
                    ),
                    new Container(
                        child: new Checkbox(
                          value : false,
                          tristate: false,
                          onChanged: (bool value){
                            pool = value;
                          },
                        )
                    ),
                    new Container(
                        child: new RoundedButton (
                          buttonName: 'Sign-up',
                          onTap:  _register,
                          width: 60.0,
                          height: 50.0,
                          bottomMargin: 10.0,
                          borderWidth: 0.0,
                          buttonColor: Colors.transparent,
                        )
                    )
                    ,
                  ],
                )
            )
        ),
      ),
    );

  }
  Firestore db = Firestore.instance;
  Future<void> _register_event(String email, String ph_no , String name, bool pool, String pass) async{
    TransactionHandler createTransaction = (Transaction tx ) async{
      DocumentSnapshot ds = await tx.get(db.collection('users').document(email));
      var dataMap =new Map<String, String>();
      dataMap['name']= name;
      dataMap['pass']=pass;
      dataMap['ph_no']=ph_no;
      dataMap['pool']=pool.toString();
      await tx.set(ds.reference, dataMap);

      return dataMap;
    };
    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      print(mapData);
      return true;
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }
}