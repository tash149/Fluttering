import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data/places_data.dart';


class PlaceCardWidget extends StatefulWidget {
  //final PlaceDetail placeDetail;
  final DocumentSnapshot post;
  PlaceCardWidget({this.post});
  @override
  _PlaceCardWidgetState createState() => _PlaceCardWidgetState();


}

class _PlaceCardWidgetState extends State<PlaceCardWidget> {





  @override
  Widget build(BuildContext context) {
    String imgPath = widget.post.data["url"];
    return Scaffold(
        appBar: AppBar(title:widget.post.data["placeName"]!=null?new Text(widget.post.data["placeName"]):new Text("Hello"),),
        body:new Column(
          children:<Widget>[
            new Container(
            child: Card(
                child: ListTile(
                  title:widget.post.data["placeName"]!=null?new Text(widget.post.data["placeName"]):new Text("Hello"),
                  subtitle:widget.post.data["content"]!=null?new Text(widget.post.data["content"]):new Text("Hello"),
                ),
               ),
              ),
            new Container(
              padding: EdgeInsets.all(10.0),
              child:new ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child:new FadeInImage(placeholder: new AssetImage("assets/map.jpg"),
                    fit: BoxFit.cover,
                    image:new NetworkImage(imgPath)
                ),
              ),
            ),
            new RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                onPressed: null,
                color: Colors.blue,
                //splashColor: Colors.lightBlueAccent,
                child: Text('Apply',
                  style: TextStyle(color: Colors.white),),
            )
            ]
          )
        );
       }
}


