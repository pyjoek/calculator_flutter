import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Color bg = const Color.fromARGB(255, 221, 221, 221);
  double width = 0;
  double height = 0;
  final List number = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+'
  ];

  void Addnumber(numb) {
    String aint = '';
    String bfloat = '';
    String oper = '';
    String total = '';
    if (numb! - '=') {
      if (numb != '+' && numb != '-' && numb != '/' && numb != '*') {
        if (numb != '.') {
          aint += numb;
        } else {
          bfloat += numb;
        }
      } else {
        oper = numb;
      }
    } else {
      print("$aint $oper ${bfloat}");
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bg,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Begginer",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "Calculator",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: width * 0.9,
                height: height * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: number.length,
                  itemBuilder: (context, index) {
                    final label = number[index];
                    return ElevatedButton(
                        onPressed: () => Addnumber(label),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusGeometry.circular(8))),
                        child: Text(
                          label,
                          style: const TextStyle(fontSize: 24),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
