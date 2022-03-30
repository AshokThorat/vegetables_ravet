import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:vegetables_ravet/app_screens/HomeScreen.dart';
import 'package:vegetables_ravet/app_screens/LoginScreen.dart';

class FlashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlashScreenState();
  }
}

class FlashScreenState extends State<FlashScreen> {

SharedPreferences preferences;
String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySharePreference();
    Timer(Duration(seconds: 3), () {


      if(name==null)
        {

          //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

          print("namevalue $name");
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                  (route) => false);
        }
      else
        {
print("namevaluenull $name");
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen(),), (route) => false,
          );
        }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage('images/logo.jpeg'),
          ),
        ),
      ),
    );
  }
  Future mySharePreference() async
  {
    preferences=await SharedPreferences.getInstance();
    setState(() {
      name=preferences.getString('name');
      print('namevalueshared $name');

    });


  }


}
