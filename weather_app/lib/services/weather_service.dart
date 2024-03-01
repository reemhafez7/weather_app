//فيوتشر لما الداتا ترجعلي بالمستقبل
//ال اسنك اني اوقف تنفيد الكزد عبال ما حاجة معية تجيني

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';


class WeatherService{

  String baseUrl ='http://api.weatherapi.com/v1';
  String apiKey ='3677bed892474b30b7a122242220806';

  getCityId({required String cityName}) {}

  Future<WeatherModel> getWeather({required String cityName}) async{
    int id = await getCityId(cityName: cityName);
    Uri url = Uri.parse('$baseUrl/api/location/$id/');
    //تحول من سترنج الى يو ار ال اوبجكت عشان اقدر استخدمو داخل ال get
    http.Response response = await http.get(url);
   // حيستقبل البيانات في response
    // ال http لازم احطها لانو بدونها ما بقدر اوصل للريسبونس
    // http.get(url) بقدر اشيل الاتشتيتيبي هنا
    //jsonDecode(response.body);
    // بدي احط النص الي حولتو لجيسن داخل متغير على شكل ماب key و value الكي دايما string
    if (response.statusCode == 400) {
      var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map < String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather=  WeatherModel.fromJason(data);

    return weather;

  }


}