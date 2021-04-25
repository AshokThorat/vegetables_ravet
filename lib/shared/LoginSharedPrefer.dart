import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginSharedPrefer
{
  static addLoginDetail(String name,String mobile,String id,String cityId) async
  {
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString('mobile',mobile);
     sharedPreferences.setString('name', name);
     sharedPreferences.setString('id', id);
     if(cityId!=null) {
       sharedPreferences.setString('cityId', cityId);
     }
     else{
       sharedPreferences.setString('cityId', 'non');
     }
  }
  static Future<SharedPreferences> loginPrefer() async
  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences;

  }
}
/*
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference
{
  static addSharedPreference(String username,String email,String mobile,String password) async
  {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("username", username);
    preferences.setString("email", email);
    preferences.setString("mobile", mobile);
    preferences.setString("password", password);
    preferences.commit();
    print('sharedPreference');
  }
  static Future<SharedPreferences> mySharedPreference() async
  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences;

  }

}
 */