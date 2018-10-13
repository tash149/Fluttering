import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType{
  login,
  register
}

class _LoginPageState extends State<LoginPage>{
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  void validateAndSubmit() async{
    if(validateAndSave()){
      print('Validate and Save');
      try {
        if(_formType == FormType.login) {
          print('Login');
          FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password); //asynchous and returns a firebase user
          print('Signed in: ${user.uid}');
        }
        else{
          print('Create');
          FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
          print('Registered User: ${user.uid}');
        }
      }
      catch(e){
        print('Error: $e');
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
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
              children: buildInputs()+buildSubmitButtons(),
            )
          )
      )
    );
  }
  List<Widget> buildInputs(){
    return[
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
    ];
  }

  List<Widget> buildSubmitButtons(){
    if(_formType == FormType.login){
      return[
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
            onPressed: moveToRegister,
            child: new Text('Create an account',style: new TextStyle(fontSize:20.0))
        )
      ];
    }
   else{
      return[
        new RaisedButton(
          child: new Text('Create an account', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
            onPressed: moveToLogin,
            child: new Text('Have an account? Login',style: new TextStyle(fontSize:20.0))
        )
      ];
    }
  }
}