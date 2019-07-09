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
                  Expanded(
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
            ],
          )

          /** Row(children: <Widget>[
            Expanded(child: Text(
            "Spice Jet",
            textDirection: TextDirection.ltr,
            style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 35.0,
            fontFamily: 'Kerb',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.white
            ),
            )
            ),
            Expanded(child: Text(
            "From Delhi to Mumbai via Banglore",
            textDirection: TextDirection.ltr,
            style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20.0,
            fontFamily: 'Kerb',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.white
            ),
            )
            ),
            ],
            ), **/
          ),
    );
  }
}
