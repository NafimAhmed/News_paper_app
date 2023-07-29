


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatelessWidget{


  TextEditingController NameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();




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
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
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
                  hintText: "Email",
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
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
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
                  hintText: "Email",
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
            onPressed: () {

              Navigator.pop(context);

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