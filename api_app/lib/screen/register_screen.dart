import 'package:api_app/pref/shared_pref_controller.dart';
import 'package:api_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/controllers/auth_api_controller.dart';
import '../models/api_response.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _emailLegnth = 0 ;

  String? _emailErorr;
  String? _passwordErorr;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _genderTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _genderTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _genderTextController.dispose();
    super.dispose();
  }

  String selectedGender = '';

  void _handleGenderChange(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Text('Welcome back ...',
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                Text('Enter your name, email & password ...',
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w300,
                    color: Colors.black45,
                    fontSize: 16,
                    height: 0.6,
                  ),),
                SizedBox(height: 20),
                TextField(
                  controller: _nameTextController,
                  style: GoogleFonts.poppins(),
                  keyboardType: TextInputType.text,
                  //********************************
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: false,
                  obscuringCharacter: '*',
                  //************************************
                  onChanged: (String value) => print(value) ,
                  onSubmitted: (String value) => print(value),
                  onTap: () => print('Tapped'),
                  //***************************************
                  showCursor: true,
                  cursorColor: Colors.blue ,
                  // cursorHeight: 0,
                  cursorWidth: 2,
                  cursorRadius: Radius.circular(0),
                  //**********************************
                  enabled: true,
                  readOnly: false,
                  //**********************************
                  autocorrect: true,
                  autofocus: false,
                  //***********************************

                  enableSuggestions: true,

                  minLines: null,
                  maxLines: null,
                  expands: true,
                  //***********************************
                  decoration: InputDecoration(
                    // counterText: '',
                    //***********************************
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    constraints: BoxConstraints(
                      maxHeight: _emailErorr == null ? 50 : 75 ,
                    ),
                    // ***********************************
                    hintText: 'Full Name',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    hintMaxLines: 1,
                    hintTextDirection: TextDirection.ltr,

                    // alignLabelWithHint: false,
                    //***********************************
                    fillColor: Colors.grey,
                    filled: false,
                    //***********************************
                    // helperText: 'Ex: email@app.com',
                    helperMaxLines: 1,
                    helperStyle: GoogleFonts.poppins(
                        color: Colors.black45,
                        fontSize: 12
                    ),
                    //***********************************
                    enabled: false,
                    //***********************************
                    // icon: Icon(Icons.email),
                    prefixIcon: Icon(Icons.person),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    //************************************
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
                        )
                    ),
                    errorText: _emailErorr,

                    //************************************
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailTextController,
                  style: GoogleFonts.poppins(),
                  keyboardType: TextInputType.emailAddress,
                  //********************************
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: false,
                  obscuringCharacter: '*',
                  //************************************
                  onChanged: (String value) => print(value) ,
                  onSubmitted: (String value) => print(value),
                  onTap: () => print('Tapped'),
                  //***************************************
                  showCursor: true,
                  cursorColor: Colors.blue ,
                  // cursorHeight: 0,
                  cursorWidth: 2,
                  cursorRadius: Radius.circular(0),
                  //**********************************
                  enabled: true,
                  readOnly: false,
                  //**********************************
                  autocorrect: true,
                  autofocus: false,
                  //***********************************
                  autofillHints: ['@gmail.com','hotmail.com'],
                  enableSuggestions: true,
                  //***********************************
                  // maxLength: 10,
                  //***********************************
                  // minLines: 1,
                  // maxLines: 1,
                  //***********************************
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  //***********************************
                  decoration: InputDecoration(
                    // counterText: '',
                    //***********************************
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    constraints: BoxConstraints(
                      maxHeight: _emailErorr == null ? 50 : 75 ,
                    ),
                    // ***********************************
                    hintText: 'Email',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    hintMaxLines: 1,
                    hintTextDirection: TextDirection.ltr,
                    //***********************************
                    // labelText: 'Email',
                    // labelStyle: GoogleFonts.poppins(
                    //   fontWeight: FontWeight.w300,
                    //   fontSize: 14,
                    // ),
                    // floatingLabelAlignment: FloatingLabelAlignment.start,
                    // floatingLabelBehavior: FloatingLabelBehavior.auto,
                    // floatingLabelStyle: GoogleFonts.poppins(
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 14,
                    // ),
                    // alignLabelWithHint: false,
                    //***********************************
                    fillColor: Colors.grey,
                    filled: false,
                    //***********************************
                    // helperText: 'Ex: email@app.com',
                    helperMaxLines: 1,
                    helperStyle: GoogleFonts.poppins(
                        color: Colors.black45,
                        fontSize: 12
                    ),
                    //***********************************
                    enabled: false,
                    //***********************************
                    // icon: Icon(Icons.email),
                    prefixIcon: Icon(Icons.email),
                    // prefixText: 'email-',
                    // prefixStyle: GoogleFonts.cabin(fontSize: 22),
                    //************************************
                    // suffixIcon: IconButton(
                    //   onPressed: (){},
                    //   icon: Icon(Icons.send),
                    // ),
                    // suffixText: 'Available',
                    // suffixStyle: GoogleFonts.poppins(
                    //   fontSize: 12,
                    //   color: Colors.grey,
                    // ),
                    //************************************
                    // border: UnderlineInputBorder(),
                    // focusedBorder: UnderlineInputBorder(
                    // borderSide: BorderSide(
                    //   color: Colors.blue.shade800,
                    // ),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    //************************************
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
                        )
                    ),
                    errorText: _emailErorr,

                    //************************************
                  ),
                ),

                SizedBox(height: 10),
                TextField(
                  controller: _passwordTextController,
                  style: GoogleFonts.poppins(),
                  obscureText: true,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: _passwordErorr == null ? 50 : 75 ,
                    ),
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),

                    //************************************
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
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
                        )
                    ),
                    errorText: _passwordErorr,
                    //************************************

                  ),

                ),
                SizedBox(height: 20.0),
             Text(
                  'Select your gender:',
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile(
                        title: Text('Male'),
                        value: 'M',
                        groupValue: selectedGender,
                        onChanged: ( gender){
                          setState(() {
                            selectedGender = gender!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text('Female'),
                        value: 'F',
                        groupValue: selectedGender,
                        onChanged: ( gender){
                          setState(() {
                            selectedGender = gender!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),



                ElevatedButton(onPressed: () => _performLogin(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('REGISTER', style: TextStyle(fontSize: 24),),
                ),
              ]
          ),
        ),
      ),
    );
  }



  void _performLogin() async{
    if(_checkData()){
      await _login();
    }
  }


  bool _checkData(){
    if(_emailTextController.text.isNotEmpty
        && _passwordTextController.text.isNotEmpty&& _nameTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data !', error: true);
    return false;
  }

  Future<void> _login() async {

    ApiResponse apiResponse = await AuthApiController()
        .register(_emailTextController.text, _passwordTextController.text, _nameTextController.text, _genderTextController.text);
    if(apiResponse.success){
      Navigator.pushReplacementNamed(context, '/users_screen');
    }
    context.showSnackBar(message: apiResponse.message, error: !apiResponse.success);

  }

}

