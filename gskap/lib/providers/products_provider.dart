import 'package:flutter/cupertino.dart';
import 'package:gskap/dio_helper.dart';
import '../models/get_products_response_model.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsProvider() {
    getAllProducts();
    // اول ما يشتغل التطبيق بكون معلم على All
    getAllCategories();


  }

  String SelectedCategory= 'All';
  selectCategory(String category){
    SelectedCategory=category;
    products=null;
    // عشان لما ينتقل من واجهة لتانية ينضف من محتوايات الاولى لما ينتقل
    notifyListeners();
    if (category=='All'){
      getAllProducts();
    }else{
   // getAllCategories();
    getCategoryProduct();
  }}

  List<Product>? products;
  List<String>? categories;
  Product? selectedProduct;

  getOneProduct(int id) async{
    selectedProduct= null;
    notifyListeners();
    // اخر سطرين عشان يعمل كلين للي قبل و اعمم
    selectedProduct= await DioHelper.dioHelper.getOneProduct(id);
    notifyListeners();
  }

  getAllProducts() async {
    products = await DioHelper.dioHelper.getAppProducts();
    notifyListeners();
  }
  
  getCategoryProduct() async{
    products= await DioHelper.dioHelper.getCategoryProducts(SelectedCategory);
    notifyListeners();
  }

  getAllCategories() async {
    categories = await DioHelper.dioHelper.getAllCategories();
    notifyListeners();
  }
}