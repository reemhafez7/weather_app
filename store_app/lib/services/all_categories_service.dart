
import '../helper/api.dart';
class AllCategoriesService{
  Future<List<dynamic>> getAllCategories() async{
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
// هنا الداتا اصلا list of string و بسيطة مش محتاج اعمل model