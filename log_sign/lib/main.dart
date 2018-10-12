import 'package:flutter/material.dart';
import 'login_pg.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
    @override
  Widget build(BuildContext context) {

      return new MaterialApp(
        title: 'Flutter Login',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new LoginPage()
      );
  }

}

