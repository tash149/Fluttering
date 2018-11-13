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
    return Scaffold(
        appBar: AppBar(title:widget.post.data["placeName"]!=null?new Text(widget.post.data["placeName"]):new Text("Hello"),),
        body:Container(
            child: Card(
                child: ListTile(
                  title:widget.post.data["placeName"]!=null?new Text(widget.post.data["placeName"]):new Text("Hello"),
                  subtitle:widget.post.data["content"]!=null?new Text(widget.post.data["content"]):new Text("Hello"),
                )
            )
        )
    );
  }
}


