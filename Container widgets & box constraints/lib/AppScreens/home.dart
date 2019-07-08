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
        child: Text("Flight",textDirection: TextDirection.ltr,),
      ),
    );


  }
}