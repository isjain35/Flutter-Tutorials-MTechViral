import "package:flutter/material.dart";

void main()
{
  runApp(
     MaterialApp(
      title: "My flutter app",
      home: Scaffold(
        appBar: AppBar(title:
        Text("My first app screen",
        style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        ),
        body: Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              "Hello world!!!",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
        ),
      )

    )
        );
}