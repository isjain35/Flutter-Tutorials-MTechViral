import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/note_list.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Notekeeper",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }

}