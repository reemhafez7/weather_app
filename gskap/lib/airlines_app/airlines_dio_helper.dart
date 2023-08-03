import 'package:dio/dio.dart';
import 'package:gskap/airlines_app/models/passengers_response.dart';

class AirlinesDioHelper {
  AirlinesDioHelper._();
  static AirlinesDioHelper airlinesDioHelper= AirlinesDioHelper._();
  Dio dio= Dio();



 Future<PassengersResponse> getPassengers([int page=0]) async{
    //بدنا نثبت انو كل بيج عبارة عن 10 اشياء
   //int page=0 يعني لو انا ما دخلت قيمة البيج رح يجبلي اول وحدة
   Response response= await dio.get('https://api.instantwebtools.net/v1/passenger',
   //بعتنا الريكوست و استخدمنا البراميترز
   queryParameters: {'size': 10, 'page': page,});
   PassengersResponse passengersResponse=PassengersResponse.fromJson(response.data);
   return passengersResponse;

  }
}