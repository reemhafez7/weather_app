import 'dart:convert';

import 'package:api_project/api/api_settings.dart';
import 'package:api_project/models/user.dart';
import 'package:http/http.dart' as http;

class UserApiController{

  Future<List<User>> getUsers() async{
   Uri uri = Uri.parse(ApiSettings.users);
   var response = await http.get(uri);
   if(response.statusCode==200){
     var jsonResponse = jsonDecode(response.body);
     var dataJsonArray = jsonResponse['date'] as List;
     return dataJsonArray.map((jsonMap) => User.fromJson(jsonMap)).toList();
   }
   return[];
  }
}