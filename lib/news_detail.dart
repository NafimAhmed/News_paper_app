

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class NewsDetail extends StatelessWidget{
  final String Title,Published_at,Published_By,Detail,ImgURL;

  const NewsDetail({super.key, required this.Title, required this.Published_at, required this.Published_By, required this.Detail, required this.ImgURL});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Image.network("${ImgURL}",
                width: 80.w,
                loadingBuilder: (context,child,loadingProgress){
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },

              ),
            ),


            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${Title}",
                    style: GoogleFonts.openSans(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text("Published By : ${Published_By}",
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.grey.shade600
                    ),
                  ),
                  Text("Published at : ${Published_at}",
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.grey.shade600
                    ),
                  ),

                  SizedBox(height: 20,),

                  Text("${Detail}",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                  ),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

}