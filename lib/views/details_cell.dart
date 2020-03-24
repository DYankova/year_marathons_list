import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final marathon;
  //to init
  DetailPage(this.marathon);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Details for the Marathon"),
      ),
      body: new Center(
        child:

        new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Image.network(marathon["Flag"]),

                  new Container(height: 30.0,),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: new Text("Date: " + marathon["Date"],
                      style: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.bold),),
                  ),

                Padding(
                  padding: EdgeInsets.all(4.0),
                     child: new Text("Country: " +marathon["CountryCode"],
                      style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),),
                ),
                Padding(
                 padding: EdgeInsets.all(4.0),
                  child: new Text(marathon["Venue"],
                    style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),),
                ),

                  Padding(
                   padding: EdgeInsets.all(4.0),
                     child: new Text("Category: " + marathon["CategoryName"],
                    style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),),
                  ),
                ] ,
              ),
            ),
          ],
        ),
      ),
    );

  }
}