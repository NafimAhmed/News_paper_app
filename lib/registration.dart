


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class Registration extends StatelessWidget{


  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [



          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child:TextField(
              maxLines: 1,
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: GoogleFonts.raleway(

                  ),
                  floatingLabelStyle: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: "Name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  )
              ),
            ),),

          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child:TextField(
              maxLines: 1,
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: GoogleFonts.raleway(

                  ),
                  floatingLabelStyle: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: "Phone Number",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  )
              ),
            ),),



          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child:TextField(
              maxLines: 1,
              controller: passwordController,
              decoration: InputDecoration(

                  labelStyle: GoogleFonts.raleway(

                  ),
                  floatingLabelStyle: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,

                  ),
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                      )
                  )
              ),
            ),),





          ElevatedButton(
            onPressed: () async {

             // Navigator.pop(context);

              String phone=phoneController.text;
              String name=nameController.text;
              String password=passwordController.text;


             // DatabaseReference rf= ref.child("profile").child("${email}");
              //DatabaseReference orderRef=ref.child(widget.phoneNumber).child("user").child("Courier").child(_phone.text.toString());


              await ref.child("profile").child("${phone}").child("user").set({
                "phone": "${phone}",
                "name": "${name}",
                "password": "${password}",


               }).then((value) {


                Get.to(HomePage(
                  Name: "${name}",
                  phone: "${phone}",
                ),
                    duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                    transition: Transition.rightToLeft );



              });


              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             BottomBar()));

              // Get.to(HomePage(),
              //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
              //     transition: Transition.rightToLeft );




            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 60.0, vertical: 15.0),
              primary: Colors.pink,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),



        ],
      ),
    );
  }

}