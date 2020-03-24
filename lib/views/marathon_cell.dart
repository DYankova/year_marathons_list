import 'package:flutter/material.dart';

class MarathonCell extends StatelessWidget{
  final marathon;
  //to init
  MarathonCell(this.marathon);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(marathon["Flag"]),
              new Container(height: 8.0,),
              Padding(
              padding: EdgeInsets.only(left: 5),
              child:
               new Text(marathon["Name"],
                style: TextStyle(fontSize: 15.0,
                    fontWeight: FontWeight.bold),),
              ),
            ] ,
          ),
        ),
        new Divider()
      ],
    );
  }
}
