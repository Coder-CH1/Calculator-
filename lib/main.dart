import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';
  String? operand;
  double? firstNum;
  double? secondNum;

  Widget calcbutton(String btnTxt, Color btnColor, Color txtColor){
    return RawMaterialButton(
      onPressed: (){
        buttonPressed(btnTxt);
      },
      shape: const CircleBorder(),
      fillColor: btnColor,
      padding: const EdgeInsets.all(20),
      child: Text(btnTxt,
        style: TextStyle(
          fontSize: 35,
          color: txtColor,
        ),
      ),
    );
  }

  void buttonPressed(String btnText) {
    setState(() {
      if (btnText == 'AC') {
        displayText = '0';
        firstNum = null;
        secondNum = null;
        operand = null;
      } else if (btnText == '+' || btnText == '-' || btnText == '*' || btnText == '/') {
        firstNum = double.tryParse(displayText);
        operand = btnText;
        displayText = '0';
      } else if (btnText == '=') {
        secondNum = double.tryParse(displayText);
        if (firstNum != null && secondNum != null && operand != null) {
          switch (operand) {
            case '+':
              displayText = (firstNum! + secondNum!).toString();
              break;
            case '-':
              displayText = (firstNum! - secondNum!).toString();
              break;
            case '*':
              displayText = (firstNum! * secondNum!).toString();
              break;
            case '/':
              displayText = (firstNum! / secondNum!).toString();
              break;
          }
          firstNum = null;
          secondNum = null;
          operand = null;
        }
      } else {
        if (displayText == '0') {
          displayText = btnText;
        } else {
          displayText += btnText;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Calculator'), backgroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Calculator display
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10.0),
                  child: Text(displayText,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white,
                        fontSize: 100
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguements
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('+/-', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            //now we will copy above row code and many more rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguements
                calcbutton('7', Colors.grey.shade800, Colors.black),
                calcbutton('8', Colors.grey.shade800, Colors.black),
                calcbutton('9', Colors.grey.shade800, Colors.black),
                calcbutton('*', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            //same as above we will make more rows in a similar way
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguements
                calcbutton('4', Colors.grey.shade800, Colors.black),
                calcbutton('5', Colors.grey.shade800, Colors.black),
                calcbutton('6', Colors.grey.shade800, Colors.black),
                calcbutton('-', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguements
                calcbutton('1', Colors.grey.shade800, Colors.black),
                calcbutton('2', Colors.grey.shade800, Colors.black),
                calcbutton('3', Colors.grey.shade800, Colors.black),
                calcbutton('+', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            //now last row is different as it has 0 button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               calcbutton('0', Colors.grey.shade800, Colors.black  ),
                SizedBox(width: 80),
                calcbutton('.', Colors.grey.shade800, Colors.white),

                calcbutton('=', Colors.grey.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}