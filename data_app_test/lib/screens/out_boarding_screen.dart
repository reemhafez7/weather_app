import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(

          'test',
              style: GoogleFonts.tajawal(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),

        ),
      ),
    );
  }
}
