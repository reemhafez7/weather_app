import 'package:flutter/material.dart';
import 'package:rental_app/pages/home_page.dart';
import 'package:rental_app/pages/login_page.dart';
import 'package:rental_app/pages/register_page.dart';
import 'package:rental_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/splash_page' ,
      routes: {
        '/splash_page' : (context) => const SplashPage(),
        '/login_page': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/register_page' : (context) => const RegisterPage(),
      },
    );
  }
}

