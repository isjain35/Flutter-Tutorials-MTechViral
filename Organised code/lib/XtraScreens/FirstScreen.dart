import 'package:flutter/material.dart';

class first_screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text(
          "Hello world!!!",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}