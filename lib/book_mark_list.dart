



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkList extends StatelessWidget{


  Query dbref=FirebaseDatabase.instance.ref("User_profile").child("bookMark");


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          FirebaseAnimatedList(

            physics: ScrollPhysics(),
            shrinkWrap: true,
            query: dbref,
            reverse: true,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {


              return ListTile(
                title: Text("text"),
              );





            },

          ),
        ],
      ),
    );
  }

}