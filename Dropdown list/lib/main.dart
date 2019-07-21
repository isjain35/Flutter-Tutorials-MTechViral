import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful app example",
    home: FavouriteCity(),
  ));
}

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavouriteCityState();
  }
}

class _FavouriteCityState extends State<FavouriteCity> {
  String nameCity = "";
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Other'];
  var _currentItemSelected = 'Rupees';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful app example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  //hintText: "Type Name of the city",
                  //helperText: "The city name",
                  labelText: "City name"),
              onSubmitted: (String userInput) {
                setState(() {
                  nameCity = userInput;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newItemSelected) {
                _dropDownItemSelected(newItemSelected);
              },
              value: _currentItemSelected,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your city is $nameCity",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _dropDownItemSelected(String newItemSelected) {

    setState(() {
      this._currentItemSelected = newItemSelected;
    });

  }
}
