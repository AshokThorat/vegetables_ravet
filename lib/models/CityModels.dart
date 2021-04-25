// To parse this JSON data, do
//
//     final cityModels = cityModelsFromJson(jsonString);

import 'dart:convert';

List<CityModels> cityModelsFromJson(String str) => List<CityModels>.from(json.decode(str).map((x) => CityModels.fromJson(x)));

String cityModelsToJson(List<CityModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModels {

  CityModels(
      {
    this.societyName,
    this.id,
  }
  );

  String societyName;
  String id;

  factory CityModels.fromJson(Map<String, dynamic> json) => CityModels(
    societyName: json["societyName"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "societyName": societyName,
    "id": id,
  };
}
