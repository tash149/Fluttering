import 'package:flutter/material.dart';
import 'login_pg.dart';
import 'auth.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
    @override
  Widget build(BuildContext context) {

      return new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Login',
          theme: new ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: new LoginPage(auth: new Auth())
      );
  }

}

