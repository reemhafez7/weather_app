import 'package:api_app/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      bool loggedIn = SharedPrefController().getValueFor<bool>(key: PrefKey.loggedIn.name) ?? false ;
      Navigator.pushReplacementNamed(context, loggedIn ? '/users_screen' : '/login_screen' );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('API APP' , style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black,
        ),),
      ),
    );
  }
}