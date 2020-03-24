import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'views/marathon_cell.dart';
import 'views/details_cell.dart';

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorldApp> {
  var _isLoading = true; //_ means private
  var marathons;

  //async method
  _fetchData() async {
    final url = "https://www.worldathletics.org/data/calendar?skip=30&take=120&fbclid=IwAR3oQkKZ89yn0fmp8KqtFX3TYMrEMGAr1w2wlTub407-1Yjf_Ufoa4OKnnU";
    //await promise
    final response = await http.get(url);

    if (response.statusCode == 200){

      final map = json.decode(response.body);

      setState(() { //statefull
          _isLoading = false;
          this.marathons = map;

        });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
    return new MaterialApp(

      home: new Scaffold( //contains wthite screen with navigation
        appBar:  AppBar(
          title: new Text("This years Marathons"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.refresh),
              onPressed: (){
                print("Reloading...");
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },)
          ],
        ),
        body: new Center(
          child:
          _isLoading ?  new CircularProgressIndicator() :
          new ListView.builder(
            itemCount: this.marathons != null ? this.marathons.length : 0,
            itemBuilder: (context, i) {
            final marathon = this.marathons[i];
              
              return new FlatButton(
                padding: new EdgeInsets.all(0.0),
                child:  new MarathonCell(marathon),
                  onPressed: (){
                  Navigator.push(context,
                  new MaterialPageRoute( //navigation
                      builder: (context) => new DetailPage(marathon)
                  )
                  );
               },
              );
            },
          )
        ),
      ),
    );
  }
}

