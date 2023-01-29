import 'package:flutter/material.dart';
class CalculatorButton extends StatelessWidget {
  CalculatorButton({Key? key,required this.btnText,this.btnColor, required this.txtColor, required this.function}) : super(key: key);
  String btnText;
  Color? btnColor;
  Color txtColor;
  Function function;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            // foregroundColor: btnColor,
            backgroundColor: btnColor!=null?btnColor:Colors.white,
          ),
          onPressed: ()  {function();},
          child: Text(
            btnText,
            style: TextStyle(color: txtColor, fontSize: 21,fontWeight: FontWeight.w700),
          )),
    );
  }
}
