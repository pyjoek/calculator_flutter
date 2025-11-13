import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // add this package!

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color bg = const Color.fromARGB(255, 221, 221, 221);

  final List<String> buttons = [
    'C',
    '⌫',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '='
  ];

  String input = '';
  String result = '';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '';
      } else if (value == '⌫') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == '=') {
        _calculateResult();
      } else {
        input += value;
      }
    });
  }

  void _calculateResult() {
    try {
      String expression = input.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
    } catch (e) {
      result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                "Beginner Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Container(
                width: width * 0.9,
                height: height * 0.12,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    result.isEmpty ? input : result,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      final label = buttons[index];
                      final isOperator =
                          ['/', '*', '-', '+', '=', '%'].contains(label);
                      final isSpecial = ['C', '⌫'].contains(label);

                      return ElevatedButton(
                        onPressed: () => onButtonPressed(label),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOperator
                              ? Colors.orangeAccent
                              : isSpecial
                                  ? Colors.redAccent
                                  : Colors.white,
                          foregroundColor: isOperator || isSpecial
                              ? Colors.white
                              : Colors.black,
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          label,
                          style: const TextStyle(fontSize: 24),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
