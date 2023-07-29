



import 'package:coders_bucket/home_page.dart';
import 'package:coders_bucket/registration.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loging extends StatelessWidget{

  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile").child("profile");



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

              Navigator.pop(context);

              if(phoneController.text.isNotEmpty)
              {

                final snapshot = await rf.child(phoneController.text.toString()).child("user").child("password").get();
                final snapshotname = await rf.child(phoneController.text.toString()).child("user").child("name").get();
                final snapshotphone = await rf.child(phoneController.text.toString()).child("user").child("phone").get();
                // final snapshotgnm = await rf.child(_mobileNumber.text.toString()).child("profile").child("gender").get();
                // final snapshotdnm = await rf.child(_mobileNumber.text.toString()).child("profile").child("dob").get();
                // final snapshotBalance = await rf.child(_mobileNumber.text.toString()).child("profile").child("balance").get();

                if (snapshot.exists) {


                  if(snapshot.value.toString()==passwordController.text.toString()){


                    Get.to(HomePage(Name: "${snapshotname.value.toString()}", phone: "${snapshotphone.value.toString()}"),
                        duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                        transition: Transition.rightToLeft );


                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MainScreen(
                    //         phoneNumber: _mobileNumber.text.toString(),
                    //         pin: snapshot.value.toString(),
                    //         firstName: snapshotfnm.value.toString(),
                    //         lastName: snapshotlnm.value.toString(),
                    //         balance: snapshotBalance.value.toString(),
                    //         gender: snapshotgnm.value.toString(),
                    //         dob: snapshotdnm.value.toString(),
                    //       );
                    //     },
                    //   ),
                    // );

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "wrong password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }




                } else {

                  Fluttertoast.showToast(
                      msg: "No Account found",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );


                }








              }







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
              "Log in",
              style: TextStyle(color: Colors.white, fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          InkWell(
            child: Text("Create new account"),
            onTap: (){

              Get.to(Registration(),
                  duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                  transition: Transition.rightToLeft );


            },
          )




        ],
      ),
    );
  }

}