import 'package:flutter/material.dart';
class MyBat extends StatelessWidget {
 final double width;
  final double height;
  MyBat({this.height,this.width });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      color: Colors.green,
      
    );
  }
}