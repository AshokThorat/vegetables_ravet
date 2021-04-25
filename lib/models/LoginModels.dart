

import 'dart:convert';

LoginModels loginModelsFromJson(String str) => LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
  LoginModels({
    this.status,
    this.message,
    this.name,
    this.contactno,
    this.id,
    this.cityid,
  });

  int status;
  String message;
  String name;
  String contactno;
  String id;
  String cityid;

  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
    status: json["status"],
    message: json["message"],
    name: json["name"],
    contactno: json["contactno"],
    id: json["id"],
    cityid: json["cityid"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "name": name,
    "contactno": contactno,
    "id": id,
    "cityid": cityid,
  };
}
