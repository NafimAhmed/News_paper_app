



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'news_detail.dart';

class BookMarkList extends StatelessWidget{

  final String userPhone;

  const BookMarkList({super.key, required this.userPhone});





  @override
  Widget build(BuildContext context) {
    Query dbref=FirebaseDatabase.instance.ref("User_profile").child("profile").child("${userPhone}").child("bookMark");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Mark"),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            FirebaseAnimatedList(

              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: true,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {


                return Container(
                  margin: EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(


                      onTap: (){
                        Get.to(NewsDetail(
                          Title: "${snapshot.child("title").value.toString()}",
                          Published_at: "${snapshot.child("Published_at").value.toString()}",
                          Published_By: "${snapshot.child("Published_By").value.toString()}",
                          Detail: "${snapshot.child("Detail").value.toString()}",
                          ImgURL: "${snapshot.child("ImgURL").value.toString()}",
                          userPhone: "${userPhone}",
                          isVisibleBookMark: false,
                        ),

                            duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                            transition: Transition.rightToLeft );
                      },



                      leading: Image.network("${snapshot.child("ImgURL").value.toString()}",
                        width: 25.w,
                        loadingBuilder: (context,child,loadingProgress){
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return CircularProgressIndicator();
                          }
                        },


                      ),
                      title: Text("${snapshot.child("title").value.toString()}",
                        style: GoogleFonts.openSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Published By : ${snapshot.child("Published_By").value.toString()}",
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                color: Colors.grey.shade600
                            ),
                          ),
                          Text("Published at : \n${snapshot.child("Published_at").value.toString()}",
                            style: GoogleFonts.openSans(
                                fontSize: 12.sp,
                                color: Colors.grey.shade600
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );




              },

            ),
          ],
        ),
      )

    );
  }

}