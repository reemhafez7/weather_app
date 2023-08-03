import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_app/screens/home_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String message = "Welcome Message";

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => message,
      child: const MaterialApp(
        home: HomeScreen2(),
      ),
    );
  }
}

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar (
        title: AppBarTitle(),
      ),
      body: ScaffoldBody(),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<int>(
        create: (context)=> 1,
        child: Column(
          children: [
            BodyText(),
          ],
        ),
    );
  }
}

class  BodyText extends StatelessWidget {
  const  BodyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}
