


import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class AllProductsService{
  //String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> getAllProducts() async{

      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');

      List<ProductModel> productList = [];

      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJason(data[i]),);
      }
      return productList;


  }
}