// To parse this JSON data, do
//
//     final categoryModels = categoryModelsFromJson(jsonString);

import 'dart:convert';

List<CategoryModels> categoryModelsFromJson(String str) => List<CategoryModels>.from(json.decode(str).map((x) => CategoryModels.fromJson(x)));

String categoryModelsToJson(List<CategoryModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModels {
  CategoryModels({
    this.name,
    this.id,
  });

  String name;
  String id;

  factory CategoryModels.fromJson(Map<String, dynamic> json) => CategoryModels(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
