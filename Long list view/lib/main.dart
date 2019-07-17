import 'package:flutter/material.dart';
void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Exploring UI widgets.",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Long List view"),
          ),
          body: getListView(),
        ),

      )
  );
}
  List<String> getListElements() {
    var items = List<String>.generate(1000, (counter) => "Item number $counter");
    return items;
  }

Widget getListView(){

  var listItems = getListElements();
  var listView = ListView.builder(
      itemBuilder: (context, index){
        var subttl = List<String>.generate(1000, (counter) => "$counter");
        return ListTile(
          leading: Icon(Icons.arrow_forward_ios),
          title: Text(listItems[index]),
          subtitle: Text("$index"),
          onTap: (){
            debugPrint("${listItems[index]} was tapped");
          },
        );
      }
  );
  return listView;
}