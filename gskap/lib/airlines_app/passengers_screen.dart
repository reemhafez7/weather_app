import 'package:flutter/material.dart';
import 'package:gskap/airlines_app/airlines_provider.dart';
import 'package:gskap/airlines_app/passengers_widget.dart';
import 'package:provider/provider.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';



class PassengersScreen extends StatelessWidget {
  const PassengersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Passengers'),),
      body: Consumer<AirlinesProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: (){provider.getMorePassenger();},
                  child: ListView.builder(
                      itemCount: provider.passenger.length,
                      itemBuilder: (context,index){
                         return PassengerWidget(provider.passenger[index]);
                      }
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
