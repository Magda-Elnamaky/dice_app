import 'package:flutter/material.dart';

class Dice extends StatelessWidget {

  final int value;

  Dice(this.value);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 80,
      height: 80,

      alignment: Alignment.center,

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 250, 249),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Text(
        "$value",

        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 194, 49, 49),
        ),
      ),
    );
  }
}