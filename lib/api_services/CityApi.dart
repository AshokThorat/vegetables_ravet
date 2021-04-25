import 'package:http/http.dart' as http;
import 'package:vegetables_ravet/Contstants.dart';
import 'package:vegetables_ravet/models/CityModels.dart';

class CityApi
{
  static Future<List<CityModels>> getCityDetail() async
  {
    try {
      final response=await http.get(Uri.parse(Constants.cityUrl));
      List<CityModels> city=cityModelsFromJson(response.body);
      return city;
    } catch (e) {
      print('ubuntu response $e');
    }
  }
}