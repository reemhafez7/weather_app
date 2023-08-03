import 'package:flutter/material.dart';
import 'package:gskap/models/get_products_response_model.dart';
import 'package:gskap/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(title: Text(provider.selectedProduct?.title??'Loading...')),
        body: provider.selectedProduct==null?
           const Center(child: CircularProgressIndicator(),) :
        Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(provider.selectedProduct!.image??''),
            ),
            Text(provider.selectedProduct!.title??''),
            Text(provider.selectedProduct!.description??''),
            Text(provider.selectedProduct!.price.toString()),
          ],
        ),
      );
    }
    );
  }

}
