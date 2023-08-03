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

  String opr ='';
  String preOpr ='';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                 Expanded(
                     child: Text(text,
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 60,
                       ),
                       maxLines: 1,
                       textAlign: TextAlign.right,
                     )
                 ),

              ],

            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('C', Color(0xffa5a5a5),),
                button('+/-', Color(0xffa5a5a5),),
                button('%', Color(0xffa5a5a5),),
                button('/', Colors.amber),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('7', Color(0xff323232)),
                button('8', Color(0xff323232)),
                button('9', Color(0xff323232)),
                button('*', Colors.amber),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('4', Color(0xff323232)),
                button('5', Color(0xff323232)),
                button('6', Color(0xff323232)),
                button('-', Colors.amber),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button('1', Color(0xff323232)),
                button('2', Color(0xff323232)),
                button('3', Color(0xff323232)),
                button('+', Colors.amber),
              ],
            ),


               Row(

                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20 ,right: 5),
                    padding: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                    onPressed: (){calculate('0');},
                    child:  Text('0',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                       ),
                       ),
                    style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xff323232) ,
                    padding: EdgeInsets.only(left: 34, top: 20, right: 128, bottom: 20),
                    shape: StadiumBorder()
                  ),

                  ),
                  ),
                  ),
                  button('.', Color(0xff323232)),
                  button('=', Colors.amber),
                ],
              ),

           SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }







  Widget button (String btnTxt, Color color){


     return Expanded(
       child: Container(
            width: 200,
            padding: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: (){
                calculate(btnTxt);
              },
              child:  Text(btnTxt,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                padding: EdgeInsets.all(20),
                shape: CircleBorder()
              ),

            ),
          ),
     );

    }




    void calculate (txtBtn){
    if (txtBtn == 'C'){
      text='0';
      numOne=0;
      numTwo=0;
      result ='';
      finalResult='0';////
      opr='';
      preOpr='';

    }else if(opr== '='&& txtBtn == '='){
      switch(preOpr){
        case'+':
          finalResult =add();
          break;
        case'-':
          finalResult =div();
          break;
        case'*':
          finalResult =mul();
          break;
        case'/':
          finalResult =div();
          break;
      }
    }
     else if(txtBtn == '+'|| txtBtn=='-'|| txtBtn=='*'|| txtBtn=='/' || txtBtn=='='){
      if(numOne == 0){
        numOne=double.parse(result);
      }else{
        numTwo =double.parse(result);
      }

      switch(opr){
        case'+':
          finalResult =add();
          break;
        case'-':
          finalResult =div();
          break;
        case'*':
          finalResult =mul();
          break;
        case'/':
          finalResult =div();
          break;

      }

      preOpr =opr;
      opr= txtBtn;
      result='';

     }
    else {
      if(result=='0')
        result =txtBtn;
      else
        result= result +txtBtn;
        finalResult =result;
    }
    setState(() {
      text=finalResult;
    });

    }



    String add() {
      result =(numOne + numTwo).toString();
      numOne = double.parse(result);
      return result;
    }
  String sub() {
    result =(numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
  String mul() {
    result =(numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
  String div() {
    result =(numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }


}
