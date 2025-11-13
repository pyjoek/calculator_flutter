import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color bg = const Color.fromARGB(255, 221, 221, 221);
  double width = 0;
  double height = 0;

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
                      "Gen'Z Simple ",
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
                height: 80,
              ),
              Container(
                width: width * 0.9,
                height: height * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width * 0.9,
                height: height * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 129, 129, 129),
                ),
              ),
              const Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
