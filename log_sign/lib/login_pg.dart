import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage>{
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      print('Email: $_email   Password: $_password');
    }
    else{
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Login')
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText:'Email'),
                  validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText:'Password'),
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
                  onSaved: (value) => _password = value,
                  obscureText: true,
                ),
                new RaisedButton(
                  child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
                  onPressed: validateAndSave,
                )
              ]
            )
          )
      )
    );
  }
}