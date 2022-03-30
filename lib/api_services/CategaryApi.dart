import 'package:http/http.dart' as http;
import 'package:vegetables_ravet/models/CategoryModels.dart';
import 'package:vegetables_ravet/models/CityModels.dart';
import 'package:vegetables_ravet/Contstants.dart';
class CategaryApi
{
  static Future<List<CategoryModels>> getCategary() async
  {
    final response=await http.post(Uri.parse(Constants.categaryUrl));
    List<CategoryModels> categary=categoryModelsFromJson(response.body);
    return categary;
  }

}