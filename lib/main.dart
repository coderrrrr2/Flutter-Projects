import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: SimpleCalculator(),
      ),
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
              btnpress.btnvalue = btn;
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: btncolor,
            padding: const EdgeInsets.all(30),
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
                          "-"),
                      calcButton('%', const Color.fromARGB(237, 212, 212, 212),
                          Colors.black, "%"),
                      calcButton('/', const Color.fromARGB(252, 247, 161, 1),
                          Colors.white, "/"),
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
                            btnpress.btnvalue = "0";
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
  String btnvalue = "";
  int outputCount = 0;
  double fontSize = 100;
  String setValue = "";
  String btnVal = "";
  String firstVal = "";
  String buttonPress() {
    if (btnvalue == "AC") {
      outputCount = 0;
      fontSize = 100;
      setValue = "";
      btnvalue = "";
      return "0";
    }

    if (setValue == "0" && btnvalue != "") {
      return "0";
    }
    if (btnvalue.isNotEmpty) {
      outputCount += 1;
    }
    if (outputCount > 0) {
      if (outputCount < 10) {
        if (outputCount % 3 == 0 && outputCount < 9) {
          btnvalue += ",";
        }
        setValue += btnvalue;
        if (outputCount < 9 && outputCount > 5) {
          fontSize -= 12;
        }
      }
      if (btnvalue == "+") {
        firstVal = setValue;
        btnVal = btnvalue;
        print("first val is $firstVal");
        print("btnval is $btnVal");
        btnvalue = "";
        setValue = "";
      }
    }
    String newSetValue = setValue.replaceAll(",", "");
    return setValue;
  }
}
