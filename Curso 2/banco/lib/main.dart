import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
      body: Column(
          children: <Widget>[
            Image.asset('images/banco_logo.png'),
            Container(
              color: Colors.green,
              height: 120,
              width: 100,
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contacts')
                ],
              ),
            ),
          ],
        ), 
      ),
    );  
  }
}