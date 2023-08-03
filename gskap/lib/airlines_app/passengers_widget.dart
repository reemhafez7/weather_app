import 'package:flutter/material.dart';
import 'package:gskap/airlines_app/models/passengers_response.dart';

class PassengerWidget extends StatelessWidget {
   PassengerWidget(this.passenger,{Key? key}) : super(key: key);
  Passenger passenger;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(height: 50,width: 50,
          child: Image.network(passenger.airline?.first.logo??'',fit: BoxFit.cover,),),
          SizedBox(width: 10,),
          Column(children: [
            Text(passenger.name??''),
            Text(passenger.trips.toString()),

          ],)

        ],
      ),
    );
  }
}
