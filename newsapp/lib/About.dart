import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Created by : AKSHAY JADHAV",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              Padding(
                padding: EdgeInsets.all(50.0),
              ),
              Text("Powered by NewsAPI.org",style:TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}