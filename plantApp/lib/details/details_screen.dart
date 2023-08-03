import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/components/iconcard.dart';
import 'package:plantapp/screens/components/titleandprice.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.only(bottom: kDefaultPadding*3),
             child: SizedBox(
               height: size.height*0.8,
               child: Row(
                 children: [
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: kDefaultPadding*3),
                       child: Column(
                       children:[
                           Align(
                             alignment: Alignment.topLeft,
                             child: IconButton(
                               padding:
                               EdgeInsets.symmetric(horizontal: kDefaultPadding),
                               icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                               onPressed: () {
                                 Navigator.pop(context);
                               },
                             ),
                           ),
                         Spacer(),

                         IconCard(icon:"assets/icons/sun.svg"),
                         IconCard(icon:"assets/icons/icon_2.svg"),
                         IconCard(icon:"assets/icons/icon_3.svg"),
                         IconCard(icon:"assets/icons/icon_4.svg"),

                        ],
                    ),
                     ),
                   ),

                   //////////
                   Container(
                     height: size.height*0.8,
                     width: size.width*0.75,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                           topLeft:Radius.circular(63),
                           bottomLeft:Radius.circular(63),
                       ),

                       boxShadow: [
                         BoxShadow(
                           color: kPrimaryColor.withOpacity(0.35),
                           blurRadius: 40,
                           offset: Offset(0,15),
                         )
                       ],
                       image: DecorationImage(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.cover,
                         image: AssetImage("assets/images/img.png"),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           TitleAndPrice(
             title:"Angelica\n",
             country:"Russion",
             price: 440,
           ),
           SizedBox(height: kDefaultPadding,),
           Row(
             children: [
               SizedBox(
                width: size.width/2,
                 height: 75,
                 child: TextButton(

                   onPressed: (){},
                   child: Text("BUY NOW",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 19,

                   ),
                   ),
                   style: ElevatedButton.styleFrom(
                       padding: EdgeInsets.only(
                         left: 18,
                         right: 18,
                       ),
                       backgroundColor: kPrimaryColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(
                             topRight: Radius.circular(20),
                         ),
                       )
                   ),
                 ),
               ),
               Expanded(
                   child:TextButton(

                     onPressed: (){},
                     child: const Text("Description",
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 20,

                       ),
                     ),
                     style: ElevatedButton.styleFrom(
                         padding: EdgeInsets.only(
                           left: 18,
                           right: 18,
                         ),
                         backgroundColor: Colors.white,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(20),
                           ),
                         )
                     ),
                   ),
               ),
             ],
           ),
         ],
       ),
     ),
    );
  }
}







