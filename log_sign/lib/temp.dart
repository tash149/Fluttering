import 'package:flutter/material.dart';

class TempPg extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Temp pg'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Log Out',style: new TextStyle(fontSize: 17.0, color: Colors.white))
          ),
        ]
      ),
      body: new Container(
        child: new Center(
          child: new Text('Temp pg', style: new TextStyle(fontSize: 32.0))
        ),
      )
    );
  }
}
