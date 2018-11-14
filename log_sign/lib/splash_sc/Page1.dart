import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => new _Page1State();
}

class _Page1State extends State<Page1> {

  Future _getPlaceName() async {
    /*documentReference = Firestore.instance.document('user/skills');
    DocumentSnapshot snapshot = await documentReference.get();
    return snapshot;*/

    var firestore = Firestore.instance;
    await firestore.settings(timestampsInSnapshotsEnabled: true);
    QuerySnapshot qn = await firestore.collection("user/pTq8Tl2KuWgYEpblue6453LgCpm1").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.green,);
  }
}


