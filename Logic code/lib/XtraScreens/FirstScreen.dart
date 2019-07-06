import 'dart:math';

import 'package:flutter/material.dart';

class first_screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text(
          LuckyNumFunction(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
  
  String LuckyNumFunction()
  {
    var random = Random();
    int number = random.nextInt(10);
    return "Lucky number is: $number";
  }
  
}