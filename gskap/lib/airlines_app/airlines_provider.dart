import 'package:flutter/material.dart';
import 'package:gskap/airlines_app/airlines_dio_helper.dart';

import 'models/passengers_response.dart';

class AirlinesProvider extends ChangeNotifier{
  AirlinesProvider(){
  getPassengers();
  //اول 10
    // (في طرق سهلة و في صعبة و في مكتبات زي flutter lazy loading)الان بدنا نعرف اذا المستخدم وصل ل اخر ال list
    //في stream لحالو بعرف انو وصل ل اخر ال listview

}
  int page =0;
  getMorePassenger(){
    page++;
    getPassengers();
  }
  List<Passenger> passenger=[];
  //ليش بنحط ليست؟


  getPassengers() async{
   PassengersResponse passengersResponse= await AirlinesDioHelper.airlinesDioHelper.getPassengers(page);
   passenger.addAll(passengersResponse.data!);
   notifyListeners();
  }
}