import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/wweather_provider.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherModel? weatherData;
  // ميثود كل الي بتعملو انها تفعل ال set state بالتالي بنعمل لل ui rebuilde
  void updateUi (){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return SearchPage(updateUi: updateUi,);
                }));
          },
              icon: const Icon(Icons.search),
          )
        ],
        title: const Text('Weather App'),

      ),
      body:Provider.of<WeatherProvider>(context).weatherData == null? const  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ) : Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
               weatherData!.getColor(),
                weatherData!.getColor()[300]!,
                 weatherData!.getColor()[100]!,
              ],
                  begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
              color: weatherData!.getColor(),
          ),
          child: Column(
            children: [
              const Spacer(flex: 3,),
              Text(
                Provider.of<WeatherProvider>(context).cityName!,
                style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
              ),
              Text(
                'Updated at ${weatherData!.date.hour.toString()} : ${weatherData!.date.second.toString()}'
                , style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Image.asset(weatherData!.getImage()),
                   Text
                     (weatherData!.temp.toInt().toString(),
                    // Or => Text('${weatherData!.temp.toInt()}')
                    style: const TextStyle(fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text('maxTemp: ${weatherData!.maxTemp.toInt()}',),
                      Text('minTemp: ${weatherData!.minTemp.toInt()}',),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Text(weatherData!.weatherStateName,
                style: const TextStyle(fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 5,),
            ],
          ),
        ),
      ),
    );
  }
}



