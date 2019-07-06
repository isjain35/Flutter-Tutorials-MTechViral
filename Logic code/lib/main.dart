import "package:flutter/material.dart";

import 'XtraScreens/FirstScreen.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My flutter app",
        home: Scaffold(
          appBar: AppBar(title:
          Text("My first app screen",
            style: TextStyle(color: Colors.black),
          ),
            backgroundColor: Colors.amber,
          ),
          body: first_screen()
        )

    );
  }

}