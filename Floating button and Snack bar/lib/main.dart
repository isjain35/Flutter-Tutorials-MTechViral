import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI widgets.",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long List view"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
        },
        child: Icon(Icons.add),
        tooltip: "Add new item",
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
      content:
      Text("You just tapped $item"),
      action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            debugPrint("UNDO clicked");
          }
      ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item number $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_forward_ios),
      title: Text(listItems[index]),
      subtitle: Text("$index"),
      onTap: () {
        showSnackBar(context, "${listItems[index]}");
        },
    );
  });
  return listView;
}
