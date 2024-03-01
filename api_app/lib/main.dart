import 'package:api_app/pref/shared_pref_controller.dart';
import 'package:api_app/screen/images/images_screen.dart';
import 'package:api_app/screen/images/upload_image_screen.dart';
import 'package:api_app/screen/launch_screen.dart';
import 'package:api_app/screen/login_screen.dart';
import 'package:api_app/screen/register_screen.dart';
import 'package:api_app/screen/users_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
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
        '/launch_screen': (context) => const LaunchScreen(),
        '/users_screen': (context) => const UserScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/images_screen': (context) => const ImagesScreen(),
        '/upload_image_screen': (context) => const UploadImageScreen(),
      },

    );
  }
}