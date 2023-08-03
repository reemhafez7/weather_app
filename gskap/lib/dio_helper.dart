

import 'package:dio/dio.dart';
import 'package:gskap/models/get_products_response_model.dart';
import 'package:gskap/models/postRequest.dart';
class DioHelper{
  DioHelper._();
  static DioHelper dioHelper= DioHelper._();
  Dio dio= Dio();


  Future<List<Product>> getAppProducts() async{
    Response response= await dio.get('http://fakestoreapi.com/products');
    List responseList =response.data;
    List<Product> products = responseList.map((e){
    return Product.fromJson(e);
    }).toList();
   return products;
  }


  Future<List<String>> getAllCategories() async{
    Response response= await dio.get('https://fakestoreapi.com/products/categories');
    List cats= response.data;
    List<String> categories = cats.map((e) => e.toString()).toList();
    return categories;
  }

  Future<List<Product>> getCategoryProducts(String Category) async{
    Response response= await dio.get('https://fakestoreapi.com/products/category/$Category');
    List responseList =response.data;
    List<Product> products = responseList.map((e){
      return Product.fromJson(e);
    }).toList();
    return products;
  }
 Future<Product> getOneProduct(int id) async{
   Response response= await dio.get('https://fakestoreapi.com/products/$id');
    return Product.fromJson(response.data);
  }

  createNewPost(PostRequest postRequest) async{
  dio.post('https://jsonplaceholder.typicode.com/posts',
    data: postRequest.toJson(),
  );
  }
}