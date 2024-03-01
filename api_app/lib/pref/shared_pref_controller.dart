import 'package:api_app/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey{loggedIn, id, fullName, email, gender, token}
enum RegKey{ fullName, email, gender, password}


class SharedPrefController{
  //String tokenM = Student().getToken;


  late  SharedPreferences _sharedPreferences ;
  static SharedPrefController? _instance ;

  SharedPrefController._();


  factory SharedPrefController(){
    return _instance ??= SharedPrefController._();
  }
  //control the creation of instances of a class.

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  //getInstance -> to create an instance of a SharedPreferences can then be used to read and write data

  SharedPreferences get preferences => _sharedPreferences;


  Future<void> save(Student student) async {

    await _sharedPreferences.setBool(PrefKey.loggedIn.name, true);
    await _sharedPreferences.setString(PrefKey.fullName.name, student.fullName);
    await _sharedPreferences.setInt(PrefKey.id.name, student.id);
    await _sharedPreferences.setString(PrefKey.email.name, student.email);
    await _sharedPreferences.setString(PrefKey.gender.name, student.gender);
    await _sharedPreferences.setString(PrefKey.token.name, "Bearer ${student.token}");

  }
  T? getValueFor<T>({required String key}){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T?;
    }
    return null ;
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  Future<void> saveToken(String token) async {
    //await _sharedPreferences.setString(PrefKey.token.name, "Bearer $tokenM");
  }



  Future<void> saveRegister(String fullName, String email, String password, String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(RegKey.fullName.name, fullName);
    await prefs.setString(RegKey.email.name, email);
    await prefs.setString(RegKey.password.name, password);
    await prefs.setString(RegKey.fullName.name, gender);


    }

}
