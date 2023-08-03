
import 'package:flutter/material.dart';
import 'package:gskap/airlines_app/airlines_provider.dart';
import 'package:gskap/airlines_app/passengers_screen.dart';
import 'package:gskap/dio_helper.dart';
import 'package:gskap/providers/products_provider.dart';
import 'package:gskap/screens/main_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(create: (context){
          return ProductsProvider();
        }),

        ChangeNotifierProvider<AirlinesProvider>(create: (context){
          return AirlinesProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: PassengersScreen()
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: ElevatedButton(
         onPressed: (){
           DioHelper.dioHelper.getAllCategories();
         },
         child: Text("press"),
       ),
     ),
    );
  }
}
