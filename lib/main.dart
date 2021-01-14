import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'Buttons.dart';
//Global Variable
String userQuestion = '';
void main() {

  runApp(MaterialApp(home: Calculator()));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var userQuestion = '';



  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7','x',
    '6','5', '4','-',
    '3','2','1','+',
    '0','.', 'ANS','='
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(

        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(

              alignment: Alignment.centerLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
              [Text(userQuestion, style: TextStyle(fontSize: 20),)])
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                  child: GridView.builder(itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      // ignore: missing_return
                      itemBuilder: (BuildContext context, int index){
                    if(index == 0 ){
                      return Button(
                        ButtonTapped:(){
                          setState(() {
                            userQuestion = '';
                          });

                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    }
                    else if(index == 1){
                      return Button(
                        ButtonTapped: (){
                          setState(() {
                            userQuestion = userQuestion.substring(0, userQuestion.length-1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                    else if(index == buttons.length-1){
                      return Button(
                        ButtonTapped: (){
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                    else{
                      return Button(
                        ButtonTapped:(){
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }

                  })))
        ],
      ),
    );
  }
  bool isOperator(String x){
    if (x == '%' || x == '/'|| x == 'x'|| x == '-'|| x == '+')
      return true;
    else
      return false;
  }
  void equalPressed(){
    userQuestion = userQuestion.replaceAll('x', '*');
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userQuestion = eval.toString();
  }
}
