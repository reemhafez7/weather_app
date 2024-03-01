import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';


class CustomAllMaids extends StatefulWidget {
  const CustomAllMaids({
    super.key, required this.backgroundColor, required this.textColor, required this.textbtn,
  });
   final Color backgroundColor;
  final Color textColor;
  final String textbtn;

  @override
  State<CustomAllMaids> createState() => _CustomAllMaidsState();
}

class _CustomAllMaidsState extends State<CustomAllMaids> {

  static const likedKey= 'liked_key';
   bool isFavorite = false;
   late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _restoreLikedSharedPreference();
  }

  void _restoreLikedSharedPreference () async{
   prefs = await SharedPreferences.getInstance();
   //var liked = prefs.getBool(likedKey);
   setState(() {
     isFavorite= prefs.getBool('isFavorite')?? false;
   });
  }

  void _likedPreference() async {
    setState(() {
      isFavorite= !isFavorite;
    });
    await prefs.setBool('isFavorite', isFavorite);
  }

  //final Image image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 96,
      width: 358,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 2,
              offset: const Offset(-2, 2),
            ),
          ]
      ),

      child: Row(
        children: [
          Image.asset('images/fast-cleaners1.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text('Aya enshasy', style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,

                        ),),
                        const SizedBox(width: 3,),
                        Text('22 Y/O', style: GoogleFonts.roboto(
                          // color: const Color(0xff717171),
                          color:  Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),),
                        const SizedBox(width: 75,),
                       Icon(FontAwesomeIcons.heart, size:15 , color: kPrimaryColor,),
                      //   IconButton(
                       //    padding: EdgeInsets.all(2),
                       //    constraints: const BoxConstraints(maxHeight: 10,maxWidth: 10),
                       //    icon: Icon(
                         //    isFavorite? FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,
                          //   size:18 ,
                          //   color: isFavorite? Colors.red:kPrimaryColor,
                         //  ),
                         //  onPressed: _likedPreference,
                        //),
                      ],

                    ),
                  ),

                const SizedBox(height: 7,),
                Text('Palestinian',
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),),
                const SizedBox(height: 6,),
                Container(
                  width:73 ,
                  height: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.backgroundColor.withOpacity(0.28),
                  ),
                  child:Center(
                    child: Text(widget.textbtn,
                      style: GoogleFonts.roboto(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: widget.textColor,
                      ),
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
// color: Color(0xff008C38).withOpacity(0.28),
//color: Color(0xff04911B),