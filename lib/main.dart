import 'package:flutter/material.dart';
import 'utils/time_metrics.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF121212)),
        primaryColor: Color(0xFF121212),
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
  double costSeconds = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.attach_money,
              color: Colors.grey,
              size: 45),
            SizedBox(
              width: 200,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (myController.text.isEmpty) {
                      costSeconds = 0.0;
                      return;
                    } else {
                      final price = double.parse(myController.text);
                      costSeconds = secondsForPrice(price, hourlyWage);
                    }
                  });
                },
                controller: myController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).primaryColor,
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                ),
              ),
            ),
          ],
        ),
        Divider(color: const Color.fromARGB(53, 158, 158, 158), thickness: 1),
        SizedBox(height: 20),
        if (costSeconds > 0)
          Column(
            children: [
              Text('It will cost you:', style: TextStyle(color: Colors.grey, fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(  
                    humanReadableFromSeconds(costSeconds),
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  ),
                  Text('of hard work', style: TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            ],
          )
        else
          Row(
            children: [
              Icon( Icons.access_time, color: const Color.fromARGB(64, 158, 158, 158)),
              SizedBox(width: 10),
              Text('Enter a price', style: TextStyle(color: const Color.fromARGB(64, 158, 158, 158), fontSize: 18)),
            ],
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
      appBar: 
      AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:12.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(53, 158, 158, 158),
              ),
              child: Icon(
                Icons.settings_outlined,
                color: const Color.fromARGB(187, 158, 158, 158),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Worth it ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See the real cost in hours.',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    WorthIt(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
