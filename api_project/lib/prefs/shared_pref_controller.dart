
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey{loggedIn ,id, fullName,email,gender, token}

class SharedPrefController{

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  SharedPrefController._();

  factory SharedPrefController(){
    return _instance ??=SharedPrefController._();
  }
  Future<void> initPreference() async {
    _sharedPreferences= await SharedPreferences.getInstance();
  }
  SharedPreferences get preferences=> _sharedPreferences;

  //Future<void> Save()

}