import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          toolbarHeight: 80,
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.white24,
          actions: [
            Padding(padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/user.png"),
            ),
            )
            
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20),
            child: Text("Aujourd'hui", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.orangeAccent,
              
              
            ),
          ],
        ),
      ),
      
    );
  }
}
