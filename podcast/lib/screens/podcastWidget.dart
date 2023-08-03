import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PodcastWidget extends StatelessWidget {
  const PodcastWidget({
    Key? key, required this.img, required this.color, required this.text1, required this.text2, required this.icon,
  }) : super(key: key);

  final String img;
  final String text1;
  final String text2;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(img),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(text2,
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: icon,
        ),
      ],
    );
  }
}