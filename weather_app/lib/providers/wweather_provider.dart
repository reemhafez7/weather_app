import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;

   String? cityName;
  set weatherData(WeatherModel? weather){
    _weatherData=weather;
    notifyListeners();
    // اي حد بستمع للكود هاد حينعملو rebuild
  }

  WeatherModel? get weatherData => _weatherData;

}
