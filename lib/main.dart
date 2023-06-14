import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleCalculator(),
    ),
  );
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  buttonPressHandler btnpress = buttonPressHandler();
  Widget calcButton(String btntxt, Color btncolor, Color txtcolor, String btn) {
// ignore: avoid_unnecessary_containers
    return Container(
      child: SingleChildScrollView(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              btnpress.btnValue = btn;
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: btncolor,
            padding: const EdgeInsets.all(27),
          ),
          child: Text(
            btntxt,
            style: TextStyle(
              fontSize: 35,
              color: txtcolor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            btnpress.buttonPress(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                              fontSize: btnpress.fontSize,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('AC', const Color.fromARGB(237, 212, 212, 212),
                          Colors.black, "AC"),
                      calcButton(
                          '+/-',
                          const Color.fromARGB(237, 212, 212, 212),
                          Colors.black,
                          "+-"),
                      calcButton('%', const Color.fromARGB(237, 212, 212, 212),
                          Colors.black, "%"),
                      calcButton('÷ ', const Color.fromARGB(252, 247, 161, 1),
                          Colors.white, "÷ "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('7', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "7"),
                      calcButton('8', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "8"),
                      calcButton('9', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "9"),
                      calcButton('x', const Color.fromARGB(252, 247, 161, 1),
                          Colors.white, "x"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('4', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "4"),
                      calcButton('5', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "5"),
                      calcButton('6', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "6"),
                      calcButton('-', const Color.fromARGB(252, 247, 161, 1),
                          Colors.white, "-"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('1', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "1"),
                      calcButton('2', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "2"),
                      calcButton('3', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "3"),
                      calcButton('+', const Color.fromARGB(252, 247, 161, 1),
                          Colors.white, "+"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            btnpress.btnValue = "0";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                            backgroundColor:
                                const Color.fromARGB(255, 75, 74, 74)),
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                      calcButton('.', const Color.fromARGB(255, 75, 74, 74),
                          Colors.white, "."),
                      calcButton('=', const Color.fromARGB(252, 247, 161, 1),
                          Colors.white, "="),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class buttonPressHandler {
  String btnValue = "";
  int outputCount = 0;
  double fontSize = 100;
  String setValue = "";
  double operationAnswer = 0;
  String previousValue = "";
  String operation = "";
  String buttonPress() {
    if (btnValue == "AC") {
      outputCount = 0;
      fontSize = 100;
      setValue = "";
      btnValue = "";
      operationAnswer = 0;
      operation = "";
      return "0";
    }
    if (btnValue.isNotEmpty) {
      outputCount += 1;
    } else {
      return "0";
    }
    if (btnValue == "=") {
      if (operation == "+") {
        operationAnswer = double.parse(previousValue) + double.parse(setValue);
      }
      if (operation == "-") {
        operationAnswer = double.parse(previousValue) - double.parse(setValue);
      }
      if (operation == "x") {
        operationAnswer = double.parse(previousValue) * double.parse(setValue);
      }
      if (operation == "+") {
        operationAnswer = double.parse(previousValue) / double.parse(setValue);
      }
      if (operation != "+") {
        setValue = operationAnswer.toInt().toString();
        operation = "";
        previousValue = "";
        return setValue;
      } else {
        setValue = operationAnswer.toString();
        operation = "";
        previousValue = "";
        return setValue;
      }
    }
    if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'x' ||
        btnValue == '÷ ' ||
        btnValue == '=' ||
        btnValue == "+-") {
      if (btnValue == "+-") {
        previousValue = "-$setValue";
      }
      previousValue = setValue;
      operation = btnValue;
      log(btnValue);
      setValue = "";
      return "";
    }
    if (outputCount < 11) {
      setValue += btnValue;
      log("setvalue $setValue");
      if (outputCount > 5) {
        fontSize -= 7;
      }
    }

    return setValue;
  }
}
