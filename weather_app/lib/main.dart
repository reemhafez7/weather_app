import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/wweather_provider.dart';

import 'models/weather_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context){return WeatherProvider();},
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        theme: ThemeData(
          primaryColor: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue
              : Provider.of<WeatherProvider>(context).weatherData!.getColor(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),

    );
  }
}
