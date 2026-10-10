import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Game",

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: 
          const Color.fromARGB(255, 216, 128, 155),
        ),
      ),

      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  State<DiceScreen> createState() => DiceScreenState();
}

class DiceScreenState extends State<DiceScreen> {

  int value1 = 1;
  int value2 = 1;
  int total = 2;

  String imagePath = "assets/sad.png";

  void roll() {
    setState(() {

      value1 = Random().nextInt(6) + 1;
      value2 = Random().nextInt(6) + 1;

      total = value1 + value2;

      if (total >= 10) {
        imagePath = "assets/happy.png";
      } else {
        imagePath = "assets/sad.png";
      }

    });
  }

  void reset() {
    setState(() {

      value1 = 1;
      value2 = 1;
      total = 2;

      imagePath = "assets/sad.png";

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Dice Game"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 220, 141, 159),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(
              "Total: $total",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 14, 3, 7),
              ),
            ),

            SizedBox(height: 20),

            Image.asset(
              imagePath,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return Text("Image not found");
              },
            ),

            SizedBox(height: 20),
            

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Dice(value1),
                Dice(value2),
              ],
            ),

            SizedBox(height: 30),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: roll,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 188, 97, 115),
                      foregroundColor: Colors.white,
                    ),

                    child: Text("Roll"),
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: ElevatedButton(
                    onPressed: reset,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 188, 97, 115),
                      foregroundColor: Colors.white,
                    ),

                    child: Text("Reset"),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}