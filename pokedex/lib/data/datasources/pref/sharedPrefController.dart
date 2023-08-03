import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  final String key = 'favourites';
  final SharedPreferences sharedPreferences;
  const SharedPrefController(this.sharedPreferences);



  List<String> fetchFavouritesList() {
    return sharedPreferences.getStringList(key) ?? [];
  }

  Future<bool> saveToFavourites(String id) async {
    List<String> list = fetchFavouritesList();
    if (!list.contains(id)) {
      list.add(id);
    }

    return await sharedPreferences.setStringList(key, list);
  }

  bool checkIfFavourite(String id) {
     return sharedPreferences.getStringList(key)?.contains(id) ?? false;
  }

  Future<bool> removeFromFavourites(String id) async {
    List<String> list = fetchFavouritesList();
    if (list.contains(id)) {
      list.remove(id);
    }
    return await sharedPreferences.setStringList(key, list);
  }
}
