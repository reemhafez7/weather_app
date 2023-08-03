import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String text ='0';
  double numOne =0;
  double numTwo =0;

  String result ='0';
  String finalResult ='0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
               Expanded(
                   child:Text(text,
                   style: TextStyle(
                     fontSize: 60,
                     color: Colors.white
                   ),
                     maxLines: 1,
                     textAlign: TextAlign.right,
                   )
               )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('C', Color(0xffa5a5a5)),
                button('+/-',Color(0xffa5a5a5) ),
                button('%', Color(0xffa5a5a5)),
                button('/', Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('7', Color(0xff323232)),
                button('8',Color(0xff323232) ),
                button('9', Color(0xff323232)),
                button('*', Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('4', Color(0xffa5a5a5)),
                button('5',Color(0xffa5a5a5) ),
                button('6', Color(0xffa5a5a5)),
                button('-', Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('1', Color(0xffa5a5a5)),
                button('2',Color(0xffa5a5a5) ),
                button('3', Color(0xffa5a5a5)),
                button('+', Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              Expanded(
                     child: Container(
                     padding: EdgeInsets.only(bottom: 10),
                     child: TextButton(
                     onPressed: (){},
                     child: Text('0',

                     style: TextStyle(
                     fontSize: 30,
                     color: Colors.black
                     ),
                     ),
                     style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.amber,
                     padding: EdgeInsets.only(left: 81,bottom: 20,right: 81,top: 20,
                         ),
                     shape: StadiumBorder(),
                     ),
                     ),
                     ),
                     ),
                button('.', Color(0xffa5a5a5)),
                button('=', Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );



  }
  Widget button (String btnTxt, Color color){
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: TextButton(
          onPressed: (){},
          child: Text('C',

            style: TextStyle(
                fontSize: 30,
                color: Colors.black
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
          ),
        ),
      ),
    );





  }
  void calculate (btnTxt) {
    if (btnTxt=='C'){
      text='0';
      numTwo=0;
      numOne=0;
      result='0';
      finalResult='0';


    }
  }
}
