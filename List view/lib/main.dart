import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exploring UI widgets.",
      home: Scaffold(
        appBar: AppBar(
          title: Text("List view"),
        ),
        body:
        getListView(),
      ),
    )
  );
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.hotel),
        title: Text("Landscape"),
        subtitle: Text("Beautiful view !!!"),
        trailing: Icon(Icons.access_alarm),
        onTap: () {
          debugPrint("First clicked");
        },
      ),
      ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("Laptop google"),
      ),
      ListTile(
        leading: Icon(Icons.laptop_windows),
        title: Text("Laptop windows"),
      ),

      Text("A new Widget"),

      Container(
        color: Colors.lightBlueAccent,
        height: 50.0,
      ),
    ],
  );
  return listView;
}