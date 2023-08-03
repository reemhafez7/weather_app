/* import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn}

class SharedPrefController {

  SharedPrefController._();

  late SharedPreferences _SharedPreferences;
  static SharedPrefController? _instanse;

  factory SharedPrefController(){
    return _instanse ?? SharedPrefController._();
  }

  Future<void> initPreference() async {
    _SharedPreferences =await SharedPreferences.getInstance();
  }

  Future<void> save () async {
    await _SharedPreferences.setBool(PrefKeys.loggedIn.name, true);
  }

  Type? getVlueFor <Type> (String key) {
    if (_SharedPreferences.containsKey(Key)){
      return _SharedPreferences.get(key) as Type;
    }
    return null;
  }

  Future<bool> removeValueFor (String key) async {
    if ( _SharedPreferences.containsKey(Key)){
      return await _SharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear(){
    return _SharedPreferences.clear();
  }
}
*
 */