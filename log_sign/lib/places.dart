import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Places extends StatefulWidget {
  @override
  _PlacesState createState() => new _PlacesState();
}

class _PlacesState extends State<Places> {
  //List<PlaceDetail> selectedplaces = List();
  //DocumentReference documentReference;

  //final DocumentReference = Firestore.instance.document('user/destination');

  Future _getPlaceList() async {
    /*documentReference = Firestore.instance.document('user/skills');
    DocumentSnapshot snapshot = await documentReference.get();
    return snapshot;*/

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("places").getDocuments();
    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body:new Container(
        child: FutureBuilder(
            future: _getPlaceList(),
            builder:(_, docsnapshot){
          if(docsnapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text("Loading..."),
            );
          }
          else{
            return ListView.builder(
              itemCount: docsnapshot.data.length,
                itemBuilder: (_,index){
                return ListTile(
                  title: Text(docsnapshot.data[index].data["placeName"]),
               );
           });
          }
       }),
      )
    );
  }
}
