import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => new _Page1State();
}

class _Page1State extends State<Page1> {
  String myText;
  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference = Firestore.instance.document("pTq8Tl2KuWgYEpblue6453LgCpm1/place_Name");

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['place_Name'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['place_Name'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.green,
        body:new Container(
          //margin: EdgeInsets.only(left: 10.0, right: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child:new Card(
                child: new Container(
                    padding:EdgeInsets.only(right: 15.0),
                    child: Text(myText,
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                    ),
                    //alignment: Alignment(0.0, 0.0),
                  ),
            )
        )
    );
  }
}


