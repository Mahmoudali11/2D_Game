import 'package:flutter/material.dart';
import 'package:testapp/grid.dart';

class Welome extends StatefulWidget {
  @override
  _WelomeState createState() => _WelomeState();
}

class _WelomeState extends State<Welome> {
  var ar = '';
  var active = Colors.green;
  var inactive = Colors.grey;
  var f = Colors.green;
  var s = Colors.grey;
  var t = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(7, 90, 96, 1),
        appBar: AppBar(     //   backgroundColor: Color.fromRGBO(86, 207, 224, 1),

          centerTitle: true,
          title: Text('"مرحبا'),
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

          children: [              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("اختر مستوى اللعبة",style: TextStyle(fontSize: 27,color: Colors.white),),
              ),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              RaisedButton(
                child: Text("سهل"),
                color: f,
                onPressed: () {
                  ar = 'easy';
                  setState(() {
                    f = active;
                    s = inactive;
                       t=inactive;
                  });
                },
              ),
              RaisedButton(
                child: Text("متوسط"),
                color: t,
                onPressed: () {
                  ar = 'medium';
                  setState(() {
                    f = inactive;
                    s = inactive;
                    t=active;
                  });
                },
              )
              ,
               RaisedButton(
                child: Text("صعب"),
                color: s,
                onPressed: () {
                  ar = 'difficult';
                  setState(() {
                    f = inactive;
                    s = active;
                       t=inactive;
                  });
                },
              )
            ]),
            Expanded(
                          child: Center(
                            child: RaisedButton(
                child: Text("ابدأ"),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Grid(v:ar);
                  }));
                },
              ),
                          ),
            )
          ],
        )));
  }
}
