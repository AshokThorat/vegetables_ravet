// To parse this JSON data, do
//
//     final sliderImgModels = sliderImgModelsFromJson(jsonString);

import 'dart:convert';

List<SliderImgModels> sliderImgModelsFromJson(String str) => List<SliderImgModels>.from(json.decode(str).map((x) => SliderImgModels.fromJson(x)));

String sliderImgModelsToJson(List<SliderImgModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SliderImgModels {
  SliderImgModels({
    this.img,
  });

  String img;

  factory SliderImgModels.fromJson(Map<String, dynamic> json) => SliderImgModels(
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
  };
}
