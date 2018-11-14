import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'places_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                String imgPath = docsnapshot.data[index].data["url"];
                return ListTile(
                  onTap: ()=> navigateToDetail(docsnapshot.data[index]),
                  leading: new Container(
                      //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                      child:new Card(

                    /*padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    //padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius:new BorderRadius.circular(5.0),
                      color: Colors.white,

                    ),*/
                    child:new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:<Widget>[
                      new Container(

                          padding:EdgeInsets.only(right: 150.0),
                          child: Text(docsnapshot.data[index].data["placeName"],
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                          ),
                          //alignment: Alignment(0.0, 0.0),
                            ),
                      new IconButton(
                        // Use the FontAwesomeIcons class for the IconData
                        padding: EdgeInsets.only(right: 10.0),
                        icon: new Icon(FontAwesomeIcons.angleRight  , color:const Color(0xff7c94b6)),  //0xff7c94b6  0xFFA67563  0xff4d342a
                      ),
                      /*new Container(
                        padding: EdgeInsets.all(10.0),
                        child:new ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child:new FadeInImage(placeholder: new AssetImage("assets/map.jpg"),
                              fit: BoxFit.scaleDown,
                              image:new NetworkImage(imgPath)
                          ),
                        ),
                      ),*/
                          ],
                        ),
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



