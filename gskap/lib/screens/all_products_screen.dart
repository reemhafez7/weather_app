
import 'package:flutter/material.dart';
import 'package:gskap/dio_helper.dart';
import 'package:gskap/providers/products_provider.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('All Products'),),
      body: Consumer<ProductsProvider>(
        builder:(context, provider, x){
          return Center(
            child: ElevatedButton(
              onPressed:() async{
               List<String> categories= await DioHelper.dioHelper.getAllCategories();
               print(categories);
              },
              child: Text('get cats'),
            ),);
        }
      ),
    );
  }
}
