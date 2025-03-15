import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:calculator_app/Widgets/buttons.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = "0";
  String expression = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "=") {
        try {
          expression = expression.replaceAll("x", "*").replaceAll("÷", "/");
          result = evaluateExpression(expression);
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "AC") {
        expression = "";
        result = "0";
      } else if (buttonText == "Clear") {
         if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
          result = expression.isNotEmpty ? expression : "0"; 
        }
      } else {
        expression += buttonText;
        result = expression;
      }
    });
  }

  String evaluateExpression(String expression) {
    try {
      final parsed = Expression.parse(expression);
      final evaluator = ExpressionEvaluator();
      final result = evaluator.eval(parsed, {});
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Calculator"),
        // backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                result,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Column(
            children: [
              Row(
                children: [
                  calcButton("7", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("8", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("9", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("÷", buttonPressed),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  calcButton("4", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("5", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("6", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("x", buttonPressed),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  calcButton("1", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("2", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("3", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("-", buttonPressed),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  calcButton(".", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("0", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("=", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("+", buttonPressed),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  calcButton("AC", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("Clear", buttonPressed),
                  SizedBox(
                    width: 10,
                  ),
                  calcButton("%", buttonPressed)
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.cyanAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
