import 'package:flutter/material.dart';
import 'package:login_sceens/screens/register_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_screen',
      routes: {
        '/login_screen': (context)=> LoginScreen(),
        '/register_screen': (context)=> RegisterScreen(),

      },
    );
  }
}
