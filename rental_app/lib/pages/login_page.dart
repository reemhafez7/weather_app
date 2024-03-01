import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_app/constants.dart';
import 'package:rental_app/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;


  final _formKey= GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

   bool _obscureText= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('images/rental2.png'),
                ]),
                const SizedBox(height: 27,),
                Text(
                  "Welcome back...",
                  style: GoogleFonts.roboto(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  "Login to continue using app",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff9A9A9A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 35),
                Text('Email',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _emailTextController,
                  style: GoogleFonts.roboto(),
                  showCursor: true,
                  cursorColor: Colors.blue.shade700,
                  cursorWidth: 2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,

                    hintText: "user@gmail.com",
                    hintStyle: GoogleFonts.roboto(
                      color: Color(0xff9A9A9A),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    hintMaxLines: 1,
                    fillColor: Color(0xffEDEDED),
                    filled: true,
                    helperMaxLines: 1,
                    helperStyle: GoogleFonts.roboto(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                    // enabled: false,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide(
                        color: Colors.blue.shade700,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade800,
                      ),
                    ),

                  ),
                  validator: (value){
                    if(value==null|| value.isEmpty){
                      return "Please enter your email address";
                    }else if(!value.contains('@' )|| !value.contains('.' )){
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text('Password',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _passwordTextController,
                  style: GoogleFonts.roboto(),
                  obscureText: _obscureText,
                  showCursor: true,
                  cursorColor: Colors.blue.shade700,
                  cursorWidth: 2,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: ". . . . . . . . . . . .",
                    hintStyle: GoogleFonts.roboto(
                      color: Color(0xff9A9A9A),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _obscureText= !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText? Icons.visibility:Icons.visibility_off,
                      ),
                    ),
                    hintMaxLines: 1,
                    fillColor: Color(0xffEDEDED),
                    filled: true,
                    helperMaxLines: 1,
                    helperStyle: GoogleFonts.roboto(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                    // enabled: false,
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide(
                        color: Colors.blue.shade700,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade800,
                      ),
                    ),

                  ),
                  validator: (value){
                    if(value==null|| value.isEmpty){
                      return "Please enter your Password";
                    }else if(value.length<8){
                      return "length of password's should be greater than 8 character";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 9),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "ForgetPassword?",
                        style: GoogleFonts.roboto(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                ]),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pushReplacementNamed(context, '/home_page');
                    }
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 27),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                       Expanded(
                        child: Divider(
                          thickness: 0.9,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('OR', style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                      ),
                       Expanded(
                          child: Divider(
                            thickness: 0.9,
                            color: Colors.grey.shade500,
                          )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 29),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have Account?  ",
                        style: GoogleFonts.roboto(
                          color: Color(0xff9A9A9A),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=> RegisterPage(),
                            ));
                          },
                          child: Text("SignUp",
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          )
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
