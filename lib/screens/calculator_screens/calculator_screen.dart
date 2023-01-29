import 'package:flutter/material.dart';
import 'package:flutter_ios_calculator/flutter_ios_calculator.dart';
import 'package:portfolio/screens/calculator_screens/components/calculator_button.dart';

import '../../configs/theme.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String showText = '0';
  String? btnText;
  Color? btnColor;
  Color? txtColor;

  // Holders
  int num1 = 0;
  int num2 = 0;
  String? op;
  String cache = '';
  String result = '';

  double width = 90;
  double height = 90;

  void calc(String btnText) {
    // AC
    if (btnText == 'AC') {
      print("object");
      setState(() {
        result = '0';
        num1 = 0;
        num2 = 0;
        op = '';
        cache = '';
      });
    } // +/-
    else if (btnText == '+/-') {
      print("object");
      if (result != '0') {
        int n = int.parse(showText) * -1;
        setState(() {
          result = (n).toString();
        });
      } else {
        setState(() {
          result = 'error';
        });
      }
    } // %
    else if (btnText == '%') {
      num1 = int.parse(showText);
      double n = (num1 / 100);
      result = n.toStringAsFixed(0);
      setState(() {
        showText = result;
        cache = '$num1 %';
      });
    } // ÷
    else if (btnText == '÷') {
      num1 = int.parse(showText);
      op = btnText;
      setState(() {
        result = '';
      });
    } // X
    else if (btnText == 'X') {
      num1 = int.parse(showText);
      op = btnText;
      setState(() {
        result = '';
      });
    } // -
    else if (btnText == '-') {
      num1 = int.parse(showText);
      op = btnText;
      print('- Tıklandı');
      setState(() {
        result = '';
      });
    } // +
    else if (btnText == '+') {
      // add Number 1 and add op later clear result
      num1 = int.parse(showText);
      op = btnText;
      setState(() {
        result = '';
      });
    } // =
    else if (btnText == '=') {
      // +
      if (op == '+') {
        num2 = int.parse(showText);
        result = (num1 + num2).toString();
        print(result);
        setState(() {
          cache = '$num1 $op $num2';
        });
      } // -
      else if (op == '-') {
        num2 = int.parse(showText);
        result = (num1 - num2).toString();
        setState(() {
          cache = '$num1 $op $num2';
        });
      } // ÷
      else if (op == '÷') {
        num2 = int.parse(showText);
        result = (num1 / num2).toString();
        setState(() {
          showText = result;
          cache = '$num1 $op $num2';
        });
      } // X
      else if (op == 'X') {
        num2 = int.parse(showText);
        result = (num1 * num2).toString();
        setState(() {
          showText = result;
          cache = '$num1 $op $num2';
        });
      }
      setState(() {
        showText = result;
      });
    } else {
      if (result == 'error') {
        setState(() {
          showText = '';
          result = int.parse(showText + btnText).toString();
        });
      } else {
        setState(() {
          result = int.parse(showText + btnText).toString();
        });
      }
    }
    showText = result;
  }


  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: Colors.white60,
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                  '$cache ',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Text(
                  '$showText ',
                  style: TextStyle(fontSize: 80, color: Colors.white),
                ),
              ]),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 900),
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Column(children: [
                // Row 1
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // AC Button
                      SizedBox(
                        width: width,
                        height: height,
                        child:CalculatorButton(btnText: 'AC', txtColor: Colors.black, function:()=>calc('AC'),btnColor: kLightGrey,)

                      ),
                      // +/- Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '+/-', txtColor: Colors.black, function:()=>calc('+/-'),btnColor: kLightGrey,)
                        // child: calcButton('+/-', kDarkGrey, Colors.black),
                      ),
                      // % Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '%', txtColor: Colors.black, function:()=>calc('%'),btnColor: kLightGrey,)
                        // child: calcButton('%', kDarkGrey, Colors.black),
                      ),
                      //  ÷ Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '÷', txtColor: Colors.white, function:()=>calc('÷'),btnColor:  kOrange,)
                        // child: calcButton('÷', kOrange, Colors.white),
                      ),
                    ],
                  ),
                ),
                //* Row 2 - 7,8,9,X
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 7 Button
                      SizedBox(
                        width: width,
                        height: height,
                      child:CalculatorButton(btnText: '7', txtColor: Colors.white, function:()=>calc('7'),btnColor:  kDarkGrey,)
                        // child: calcButton('7', kDarkGrey, Colors.white),
                      ),
                      //  8 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '8', txtColor: Colors.white, function:()=>calc('8'),btnColor:  kDarkGrey,)
                        // child: calcButton('8', kDarkGrey, Colors.white),
                      ),
                      //  9 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '9', txtColor: Colors.white, function:()=>calc('9'),btnColor:  kDarkGrey,),
                        // child: calcButton('9', kDarkGrey, Colors.white),
                      ),
                      //  X Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: 'x', txtColor: Colors.white, function:()=>calc('X'),btnColor:  kOrange,)
                        // child: calcButton('X', kOrange, Colors.white),
                      ),
                    ],
                  ),
                ),
                // Row 3 - 4,5,6,-
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 4 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '4', txtColor: Colors.white, function:()=>calc('4'),btnColor:   kDarkGrey,)
                        // child: calcButton('4', kDarkGrey, Colors.white),
                      ),
                      //  5 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '5', txtColor: Colors.white, function:()=>calc('5'),btnColor:   kDarkGrey,)
                        // child: calcButton('5', kDarkGrey, Colors.white),
                      ),
                      //  6 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '6', txtColor: Colors.white, function:()=>calc('6'),btnColor:   kDarkGrey,)
                        // child: calcButton('6', kDarkGrey, Colors.white),
                      ),
                      //  - Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '--', txtColor: Colors.white, function:()=>calc('-'),btnColor:kOrange,)
                        // child: calcButton('--', kOrange, Colors.white),
                      ),
                    ],
                  ),
                ),
                //Row 4 - 1,2,3,+
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 1 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '1', txtColor: Colors.white, function:()=>calc('1'),btnColor:  kDarkGrey,)
                        // child: calcButton('1', kDarkGrey, Colors.white),
                      ),
                      //  2 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '2', txtColor: Colors.white, function:()=>calc('2'),btnColor:  kDarkGrey,)
                        // child: calcButton('2', kDarkGrey, Colors.white),
                      ),
                      //  3 Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '3', txtColor: Colors.white, function:()=>calc('3'),btnColor:  kDarkGrey,)
                        // child: calcButton('3', kDarkGrey, Colors.white),
                      ),
                      //  + Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '+', txtColor: Colors.white, function:()=>calc('+'),btnColor:  kOrange,)
                        // child: calcButton('+', kOrange, Colors.white),
                      ),
                    ],
                  ),
                ),
                // Row 5 - 0,virgül(,),=
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 0 Button
                      Container(
                        constraints: BoxConstraints(maxWidth: 290),
                        width: screenWidth / 2.50,//width+width+30,
                        height: height,
                    child:CalculatorButton(btnText: '0', txtColor: Colors.white, function:()=>calc('0'),btnColor:   kDarkGrey,)
                        // child: calcButton('0', kDarkGrey, Colors.white),
                      ),
                      //  . Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '.', txtColor: Colors.white, function:()=>calc('.'),btnColor:  kOrange,)
                        // child: calcButton('.', kOrange, Colors.white),
                      ),
                      //  = Button
                      SizedBox(
                        width: width,
                        height: height,
                          child:CalculatorButton(btnText: '=', txtColor: Colors.white, function:()=>calc('='),btnColor: kOrange,)
                        // child: calcButton('=', kOrange, Colors.white),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
/*  Widget calcButton(btnText, btnColor, txtColor) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: btnColor,
            onPrimary: Colors.white,
          ),
          onPressed: () => calc(btnText),
          child: Text(
            btnText,
            style: TextStyle(color: txtColor, fontSize: 21),
          )),
    );
  }
*/