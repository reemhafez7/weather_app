import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/api_response.dart';
import '../api_settings.dart';

class AuthApiController {

 Future<ApiResponse > login(String email, String password) async{

   Uri uri = Uri.parse(ApiSettings.users);
   var response = await http.post(uri,
   body: {"email" : email , "password" : password},
   );
   if(response.statusCode==200|| response.statusCode==400) {
     var jsonResponse = jsonDecode(response.body);
     if (response.statusCode==200){
       // Student student =Student.fromJson(jsonResponse['object']);
     }

     return ApiResponse(jsonResponse['message'],jsonResponse['status']);
   }
   return ApiResponse('Something Went Wrong, try again!',false);
 }

}