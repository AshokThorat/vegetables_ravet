import 'package:http/http.dart' as http;
import 'package:vegetables_ravet/Contstants.dart';
import 'package:vegetables_ravet/models/SliderImgModels.dart';

class SliderImgApi
{
  static Future<List<SliderImgModels>> getSliderImage() async
  {
    try {
      final response=await http.get(Uri.parse(Constants.sliderUrl));
      List<SliderImgModels> img=sliderImgModelsFromJson(response.body);
      return img;
    } catch (e) {
      print('response $e');
    }
  }
}