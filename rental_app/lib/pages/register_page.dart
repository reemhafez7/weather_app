import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final  _fullNameController = TextEditingController();
  final  _emailTextController= TextEditingController();
  final  _passwordTextController= TextEditingController();
  final  _phoneNumbertController= TextEditingController();


  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneNumbertController.dispose();
    super.dispose();
  }
  bool _obscureText=false;
  bool _obscureText1=false;
  bool isChecked =false;
  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pushReplacementNamed(context, '/login_page');},
          icon: Icon(Icons.arrow_back,
          color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 87,),
              Center(child: Image.asset('images/rental2.png')),
              const SizedBox(height: 25,),
              Text(
                "Welcome back!",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 13,),
              Text(
                "Create you're new account",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff9A9A9A),
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 30,),
              Form(
                key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name',
                          style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _fullNameController,
                        style: GoogleFonts.roboto(),
                        showCursor: true,
                        cursorColor: Colors.blue.shade700,
                        cursorWidth: 2,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,

                          hintText: "User Name",
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
                            FontAwesomeIcons.user,
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
                            return 'Please choose a User name';
                          }else if(value.length<4){
                            return 'Please choose a User name with at least 4 character';
                          }
                          return null;
                         },
                      ),
                      const SizedBox(height: 20),
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
                        cursorColor: kPrimaryColor,
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
                      Text('Phone Number',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),

                      const SizedBox(height: 5),

                      IntlPhoneField(
                        controller: _phoneNumbertController,
                        style: GoogleFonts.roboto(),
                        showCursor: true,
                        cursorColor: Colors.blue.shade700,
                        cursorWidth: 2,

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "0000000000",
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
                          if(value==null){
                            return "Please enter your Password";
                          }
                          return null;
                        },
                      ),
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
                                  _obscureText? Icons.visibility_off:Icons.visibility,
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
                      const SizedBox(height: 20),
                      Text('Confirm Password',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                      const SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.roboto(),
                        obscureText: _obscureText1,
                        showCursor: true,
                        cursorColor: Colors.blue.shade700,
                        cursorWidth: 2,

                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _obscureText1= !_obscureText1;
                              });
                            },
                            child: Icon(
                              _obscureText1? Icons.visibility_off:Icons.visibility,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          hintText: ". . . . . . . . . . . .",
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
                          }else if(value != _passwordTextController.text){
                            return "Password mismatch";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Checkbox(
                    activeColor: kPrimaryColor,
                    //focusColor: Color(0xffBEC0CA),
                    side: const BorderSide(
                        width: 1,
                        color: Color(0xffBEC0CA),
                    ),
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked=newValue!;
                        });
                      },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text('I agree to the ',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6E7079),
                  ),
                  ),
                  Text('Privacy Policy and Terms of Use',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
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
                  "Submit",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
