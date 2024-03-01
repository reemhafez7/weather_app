
import 'package:flutter/material.dart';

class WeatherModel{
   DateTime date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;

  WeatherModel({required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName});

  //constractor for data that comes from the internet عشان ابنيه بشكل مختلف
  //fromJason(date) , the data either 1)string of dynamic
  //                                  2) map <string, dynamic>

 factory WeatherModel.fromJason(Map<String,dynamic> data){
   // ال date مش موجود جوا jsonData موجود جوا data
   //var jsonData = data['weather_state_name'];
   return WeatherModel(
       date: DateTime.parse(data['the_temp']),
       temp: data['the_temp'],
       maxTemp: data['man_temp'],
       minTemp: data['min_temp'],
       weatherStateName: data['weather_state_name']
   );
 }
  // ال factory بعمل return ل object نفس نوع الكلاس (object model)
  // الي عملناه انو استخدمنا constractor عادي عشان اعمل return ل object فيه البيانات الي انا بدي اياها
  // اي تطبيق بستقبل فيه بيانات من النت حلاقي فيه factory constractor

   @override
   String toString() {
     return 'tem = $temp  minTemp = $minTemp  date = $date';
   }

   String getImage(){
   if (weatherStateName =='Clear'||weatherStateName == '' ){
     return 'images/clear.png';
   }else if (weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
     return 'images/snow.png';
   } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
     return 'images/cloudy.png';
   } else if (weatherStateName == 'Patchy rain possible' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers	') {
     return 'images/rainy.png';
   } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
     return 'images/thunderstorm.png';
   } else {
     return 'images/clear.png';
   }
   }

   MaterialColor getColor(){
     if (weatherStateName =='Clear'||weatherStateName == 'Sunny' || weatherStateName == 'partly cloudy'){
       return Colors.orange ;
     }else if (weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
       return Colors.blue;
     } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
       return Colors.blueGrey;
     } else if (weatherStateName == 'Patchy rain possible' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers	') {
       return Colors.blue;
     } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
       return Colors.deepPurple;
     } else {
       return Colors.orange;
     }
   }


}