



import 'dart:convert';

import 'package:coders_bucket/news_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map <String, dynamic>? apiMap;


  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e4101ab407174f99b481ec252417eacc')
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [


            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: apiMap!['articles'].length,
                itemBuilder: (context,index){

                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(


                        onTap: (){
                          Get.to(NewsDetail(
                              Title: "${apiMap!['articles'][index]['title'].toString()}",
                              Published_at: "${apiMap!['articles'][index]['publishedAt'].toString()}",
                              Published_By: "${apiMap!['articles'][index]['author'].toString()}",
                              Detail: "${apiMap!['articles'][index]['description'].toString()}",
                            ImgURL: "${apiMap!['articles'][index]['urlToImage'].toString()}",
                          ),

                              duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                              transition: Transition.rightToLeft );
                        },


                        leading: Image.network("${apiMap!['articles'][index]['urlToImage'].toString()}",
                          width: 25.w,
                          loadingBuilder: (context,child,loadingProgress){
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator();
                            }
                          },


                        ),
                        title: Text("${apiMap!['articles'][index]['title'].toString()}",
                          style: GoogleFonts.openSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Published By : ${apiMap!['articles'][index]['author'].toString()}",
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                color: Colors.grey.shade600
                              ),
                            ),
                            Text("Published at : \n${apiMap!['articles'][index]['publishedAt'].toString()}",
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

                })





          ],


        ),
      ),
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserData();
  }



}