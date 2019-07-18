import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 50.0),
          alignment: Alignment.center,
          color: Colors.deepPurple,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Spice Jet",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35.0,
                        fontFamily: 'Kerb',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  )),
                  Expanded(
                      child: Text(
                    "From Delhi to Mumbai via Banglore",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        fontFamily: 'Kerb',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Expanded(
                          child: Text(
                        "Emirates",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 35.0,
                            fontFamily: 'Kerb',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "From Dubai to America via India",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        fontFamily: 'Kerb',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  )),
                ],
              ),
              FlightImage(),
              FlightBook(),
            ],
          )
          ),
    );
  }
}

class FlightImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/plane.png');
    Image image = Image(image: assetImage, width: 250.0, height: 250.0, color: Colors.white,);
    return Container(child: image,);
  }

}

class FlightBook extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
          elevation: 6.0,
          color: Colors.deepOrange,
          child: Text(
            "Book your tickets",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'kerb',
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: ()=> bookFlight(context)
      ),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Booked successfully"),
      content: Text("Happy journey"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog
    );
  }
}