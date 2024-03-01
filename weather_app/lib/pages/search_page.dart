import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/wweather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  // خليتها تستقبل البيانات الي بدي اباصيها
   SearchPage({Key? key, this.updateUi}) : super(key: key);
  late String cityName;
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              cityName = data;
              // هيك القيمة بتتخزن حتى من من اشارة البحث
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service =WeatherService();
             WeatherModel weather= await service.getWeather(cityName: cityName!);
             // بدي احط قيمة ال weather الي فوق بال weather تبع ال provider
             Provider.of<WeatherProvider>(context, listen: false).weatherData= weather;
             Provider.of<WeatherProvider>(context, listen: false).cityName= cityName;

             //updateUi!();
             Navigator.pop(context);
            },
            //onChanged: (data){
            //  print(date);
            //},
            //عشان اخد داتا من اليوزر طول ما هو بدخل
            // اما اون سبمت الداتا مش حتنبعت الا بس اعمل سبمت
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('Search'),
              suffixIcon: GestureDetector(
                onTap: () async{
                  WeatherService service = WeatherService();

                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                  Navigator.pop(context);
                },
                  child: Icon(Icons.search
                  )),
              border: OutlineInputBorder(),
              hintText: 'Enter City'
            ),
          ),
        ),
      ),
    );
  }
}

