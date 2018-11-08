import 'package:flutter/material.dart';
import 'login_pg.dart';
import 'auth.dart';
import 'root_page.dart';
import 'home_pg.dart';
import 'welcome_pg.dart';
import'temp.dart';

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
        home: new RootPage(auth: new Auth()),
        routes: <String, WidgetBuilder>{
          '/HomePg': (BuildContext context) => new HomePage(),
          '/WelcomePg': (BuildContext context) => new WelPage(),
          '/LogInPg':(BuildContext context) => new LoginPage(auth: new Auth()),
          '/TempPg':(BuildContext context) => new TempPg()
          },
      );
  }

}

