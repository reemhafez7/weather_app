import 'package:data_app_test/screens/login_screen.dart';
import 'package:data_app_test/screens/lunch_screen.dart';
import 'package:data_app_test/screens/out_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/lunch_screen',
      routes: {
        '/lunch_screen' : (context) => const LaunchScreen(),
        '/out_boarding_screen' : (context) => const OutBoardingScreen(),
        '/login_screen' : (context) => const LoginScreen(),


      },
    );
  }
}

