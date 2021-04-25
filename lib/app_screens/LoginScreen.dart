import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegetables_ravet/api_services/LoginApi.dart';
import 'package:vegetables_ravet/app_screens/HomeScreen.dart';
import 'package:vegetables_ravet/app_screens/RegistorScreen.dart';
import 'package:vegetables_ravet/models/LoginModels.dart';
import 'package:vegetables_ravet/shared/LoginSharedPrefer.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  var mobileController=TextEditingController();
  var passwordController=TextEditingController();
  LoginModels loginModels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('images/logo.jpeg'), width: 200, height: 200),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Mobile',
                    counterText: '',
                    labelText: 'Enter the Mobile No'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Password',
                    labelText: 'Enter the Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      var contactno=mobileController.text;
                      var password=passwordController.text;
                      var regId='1234';

                      LoginApi.getLoginDetail(contactno, password, regId).then((value){

                        setState(() {
                          loginModels=value;
                          int status=loginModels.status;
                          print("response ${loginModels.message}");

                          if(status==1)
                            {
                              String name=loginModels.name;
                              String mob=loginModels.contactno;
                              String city=loginModels.cityid;
                              String id=loginModels.id;
                              LoginSharedPrefer.addLoginDetail(name, mob, id, city);
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);


                            }
                          else
                            {
                              print("response ${loginModels.message}");
                            }
                        });
                      });


                    },
                    child: Text("Login"),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )))),
                width: 300,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Forget Password'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text('No Account Yet? Create One'),
                onTap: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistorScreen()));

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RegistorScreen()), (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
