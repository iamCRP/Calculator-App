import 'package:calculator_app/color.dart';
import 'package:calculator_app/widget/btnwidget.dart';
import 'package:calculator_app/widget/containerwidget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String inputD = "";
  String result = "";

  void inputhandle(String userinput) {
    setState(() {
      if (userinput == "AC") {
        inputD = "0";
        result = "";
        return;
      }
      if (userinput == "⌫") {
        if (inputD.isNotEmpty) {
          inputD = inputD.substring(0, inputD.length - 1);
        }
        return;
      }
      if (userinput == "=") {
        try {
          String finalInput = inputD
              .replaceAll("x", "*")
              .replaceAll("/", "/100");
          Parser p = Parser();
          Expression exp = p.parse(finalInput);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
        } catch (e) {
          result = "Error";
        }
        return;
      }

      List<String> operators = ["+", "-", "x", "/", "%"];
      if (operators.contains(userinput)) {
        if (inputD.isEmpty) return;
        String lastChar = inputD[inputD.length - 1];
        if (operators.contains(lastChar)) return;
      }

      if (userinput == "0" && inputD == "0") return;

      if (inputD == "0" && userinput != ".") {
        inputD = userinput;
        return;
      }

      inputD += userinput;
    });
  }

  Widget buildButtonRow(List<Map<String, dynamic>> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((btn) {
          return Expanded(
            child: Btnwidget(
              btntxt: btn["text"],
              isbtn: btn["isbtn"] ?? false,
              isequal: btn["isequal"] ?? false,
              ontap: () {
                inputhandle(btn["text"]);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CALCULATOR",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: actioncolor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            ContainerPage(inputtxt: inputD, reslutxt: result),
            SizedBox(height: screenHeight * 0.02),

            // ✅ Buttons responsive with Expanded
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  buildButtonRow([
                    {"text": "AC"},
                    {"text": "⌫"},
                    {"text": "%"},
                    {"text": "/", "isbtn": true},
                  ]),
                  buildButtonRow([
                    {"text": "7"},
                    {"text": "8"},
                    {"text": "9"},
                    {"text": "x", "isbtn": true},
                  ]),
                  buildButtonRow([
                    {"text": "4"},
                    {"text": "5"},
                    {"text": "6"},
                    {"text": "-", "isbtn": true},
                  ]),
                  buildButtonRow([
                    {"text": "1"},
                    {"text": "2"},
                    {"text": "3"},
                    {"text": "+", "isbtn": true},
                  ]),
                  buildButtonRow([
                    {"text": "0"},
                    {"text": "."},
                    {"text": "=", "isbtn": true, "isequal": true},
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
