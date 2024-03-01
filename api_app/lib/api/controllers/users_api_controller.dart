import 'dart:convert';
import 'package:api_app/api/api_settings.dart';
import 'package:api_app/models/user.dart';
import 'package:http/http.dart' as http;

class UsersApiController {

  Future<List<User>> getUsers() async {
    Uri uri = Uri.parse(ApiSettings.user);
    var response = await http.get(uri);

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['data'] as List;
      return dataJsonArray.map((jsonMap) => User.fromJson(jsonMap)).toList();

    }
    return[] ;


  }
}