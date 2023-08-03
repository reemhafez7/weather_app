import 'package:api_project/screens/launch_screen.dart';
import 'package:api_project/screens/users_screen.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen' :(context) => const LaunchScreen(),
        '/users_screen' :(context) => const UsersScreen(),
      },
    );
  }
}
