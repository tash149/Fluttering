import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'places_card.dart';

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
    await firestore.settings(timestampsInSnapshotsEnabled: true);
    QuerySnapshot qn = await firestore.collection("places").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceCardWidget(post: post)));
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
                  onTap: ()=> navigateToDetail(docsnapshot.data[index]),
                  leading: new Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                      child:new Card(

                    /*padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    //padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:new BorderRadius.circular(5.0),
                      color: Colors.white,

                    ),*/
                    child:new Container(
                        child: Text(docsnapshot.data[index].data["placeName"],
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                        ),
                      alignment: Alignment(0.0, 0.0),
                    )
                  )
                  )
               );
           });
          }
       }),
      )
    );
  }
}



