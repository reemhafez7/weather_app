import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:pokedex/presentation/injector.dart';
import 'package:pokedex/presentation/pages/home/home_screen.dart';
import 'package:pokedex/presentation/pages/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokedex/presentation/widgets/lunch_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();
  runApp(
      const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        sliderTheme: SliderTheme.of(context).copyWith(
          trackHeight: 5,
          thumbShape: SliderComponentShape.noThumb,
          overlayShape: SliderComponentShape.noThumb,
        ),

        primaryColor: ColorConstants.blue,
      ),
      home: const LunchScreen(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'pokemonDetail') {
          final Map<String, dynamic> value =
              settings.arguments as Map<String, dynamic>; // Retrieve the value.
          return MaterialPageRoute(
            builder: (_) => PokemonDetailScreen(
              pokemonDetailEntity: value['detail'],
            ),
          );
        }
        return null;
      },


      initialRoute:'/lunch_screen' ,
      routes: {
        '/lunch_screen' : (context) => const LunchScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
