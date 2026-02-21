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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const MyHomePage(),
    );
  }
}

class WorthIt extends StatefulWidget {
  const WorthIt({super.key});

  @override
  State<WorthIt> createState() => _WorthItState();
}

class _WorthItState extends State<WorthIt> {

  final myController = TextEditingController();
  final double hourlyWage = 15.0;
  double cost = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: myController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              cost = double.parse(myController.text) / hourlyWage;
            });;
          },
          child: Text('Submit'),
        ),
        Text(
          cost.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          Icon(Icons.settings),
          Icon(Icons.account_circle)
          ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Worth it ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See the real cost in hours.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                WorthIt(),
              ],
            ),
          ),
        ),
      )
    );
  }
}