import 'package:flutter/material.dart';
class MyBall
 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
          //margin: EdgeInsets.all(40),
          
          width: 50,
          height: 50,
          decoration: BoxDecoration( shape: BoxShape.circle,color: Colors.red
          
          ));
  }
}