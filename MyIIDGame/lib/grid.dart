 

 
import 'dart:math';

import 'package:flutter/material.dart';
import 'myball.dart';
import 'MyBat.dart';
class Grid extends StatefulWidget {
  var  v='';
  Grid({this.v});
  @override
  _GridState createState() => _GridState(vs: v);
}

class _GridState extends State<Grid> with SingleTickerProviderStateMixin {
  var vs='';
  _GridState({this.vs});
  int score=0;
 var x=dir.right;
 var y=dir.buttom;
 var level=3;
  Animation<double> anim;
  AnimationController animController;
  double batPos;
   double width=0;
      double heigth=0;
      double bwidth=0;
      double bheight=0;
      double posx=0;
      double posy=0;
 double i=0.0;
 @override
 void dispose() {
   print('released');
   animController.dispose();
    super.dispose();
  } 
 @override
 void initState() {
   if(vs=='easy'){
     level=4;
   }
   else if(vs=='medium'){
     level=7;
   }
   else{
     level=11;
   }
  
   batPos=0;
  
   posx=0;
   posy=0;
    animController=AnimationController(vsync: this,duration:Duration (seconds: 1000));
    anim=Tween<double>().animate(animController);
    anim.addListener(() {
     
       safeSetState((){
           (x==dir.right)?posx+=(level*getRandNom()):posx-=(level*getRandNom());
      (y==dir.buttom)?posy+=(level*getRandNom()):posy-=(level*getRandNom());
       });
      checkEdges();

    });
    animController.forward();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      

    return Scaffold(
              backgroundColor: Color.fromRGBO(7, 90, 96, 1),
         appBar: AppBar(
                 //  backgroundColor: Color.fromRGBO(86, 207, 224, 1),
title: Text('!وقتا ممتعا'),centerTitle: true,),
          body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints cons){
            width=cons.maxWidth;
            heigth=cons.maxHeight;
           bwidth=width/4;
            bheight=heigth/20;
           
           // print("wid:$width");
            

             
          return Stack(children: [ Positioned(child: Text('$score :النقاط',style: TextStyle(fontSize: 27,color: Colors.white),),right: 20,),Positioned(child: MyBall(),
          top: posy,
          left: posx,
           
          ), Positioned(child: GestureDetector(onHorizontalDragUpdate: (update){
           updateBatPosition(update);
        


          },child: MyBat(width:bwidth,height:bheight))
          ,bottom:0,left: batPos,)
          ,
        
          ])
          ;
        },
        
      ),
    );  
  }
 

void checkEdges(){
if(posx<=0&&x==dir.left){
  x=dir.right;


}
if(posx>=width-50&&x==dir.right){
  x=dir.left;
  

}
if(posy<=0&&y==dir.top){
  y=dir.buttom;


}
if(posy>=heigth-50&&y==dir.buttom){
  y=dir.top;
  
}
if(posy>=heigth-50-bheight&&y==dir.buttom){
if(posx>=batPos-50&&posx<=batPos+bwidth){
  setState(() {
    score++;
  });
  y=dir.top;

}
else{
  animController.stop();

showMess(context);

   
}}


 }
 void updateBatPosition(DragUpdateDetails v){
   safeSetState((){

   batPos+=v.delta.dx;


   });
  // print(batPos);
   
 }
 //call setSate will throw errow if mounted
 void safeSetState(Function function) {
 if (mounted && animController.isAnimating) {
 setState(() {
 function();
 });
 }
 }
 void showMess(BuildContext context){
    final alert=AlertDialog(title: Text("!لقد خسرت\n هل تريد اللعب مجددا؟",),actions: [FlatButton(onPressed: (){
     animController.repeat();
     setState(() {
       posx=0;
       posy=0;
       score=0;
       Navigator.of(context).pop();

     });

   }, child: Text("نعم")),FlatButton(onPressed: (){
     Navigator.of(context).pop();

     //dispose();

   }, child: Text("لا"))],);
   showDialog(context: context,child:alert);
 }
 double getRandNom(){
   int xn=Random().nextInt(100);
   return(xn+50)/100;
 }
  
}
enum dir{
  left,top,right,buttom

}