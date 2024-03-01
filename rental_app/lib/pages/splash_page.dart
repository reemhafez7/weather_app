import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState() {
    super.initState();
    print('initState');
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, '/login_page');

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Center(
       child: Container(
         height: 212,
         width: 333,
         child: Image.asset('images/rental_logo.png'),
         ),
            ),
    );
  }
}
