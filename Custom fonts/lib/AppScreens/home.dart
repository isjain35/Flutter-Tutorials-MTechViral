import 'package:flutter/material.dart';

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
   //     width: 200.0,
   //     height: 100.0,
   //     margin: EdgeInsets.all(20.0),
   //     margin: EdgeInsets.only(bottom: 40,right: 40),
   //     padding: EdgeInsets.only(),
        child: Text(
          "Flight",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 75.0,
            fontFamily: 'Kerb',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: Colors.white
          ),
        ),
      ),
    );


  }
}