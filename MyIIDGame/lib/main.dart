import 'package:flutter/material.dart';
import 'package:testapp/grid.dart';
import 'package:testapp/welcome.dart';
import 'myball.dart';
import 'MyBat.dart';
import 'grid.dart';

void main() {
 // showDialog(context: null)
  runApp(MyApp());
}
var x=Grid();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myGame',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 100, 102, 1),
       
        //primarySwatch:Colors.deepOrange,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/':(context)=>Welome(),
        '/myGrid':(context)=>Grid()

      },
      
    );
  }
}

