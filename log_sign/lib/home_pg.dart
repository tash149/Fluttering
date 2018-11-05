import 'package:flutter/material.dart';
import 'auth.dart';
import 'welcome_pg.dart';

class HomePage extends StatelessWidget{
  HomePage({this.auth , this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async{
    try{
      await auth.signOut();
      onSignedOut();
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WelPage();
    /*return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome'),
        actions: <Widget>[
          new FlatButton(
              onPressed: _signOut,
              child: new Text('Log Out',style: new TextStyle(fontSize: 17.0, color: Colors.white))
          ),
        ]
      ),
      body: new Container(
        child: new Center(
          child: new Text('Welcome', style: new TextStyle(fontSize: 32.0))
        ),
      )
    );*/
  }
}