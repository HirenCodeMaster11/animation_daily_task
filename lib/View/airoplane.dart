import 'package:flutter/material.dart';

class Airoplane extends StatefulWidget {
  const Airoplane({super.key});

  @override
  State<Airoplane> createState() => _AiroplaneState();
}

class _AiroplaneState extends State<Airoplane> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Animated Container",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 24,letterSpacing: 1),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
        ),
        body: AnimatedContainer(
          padding: EdgeInsets.only(bottom: 100.0),
          duration: Duration(seconds: 1),
          alignment: alignment,
          child: Container(
            height: 35.0,
            child: Icon(
              Icons.airplanemode_active,
              color: iconColor,
              size: 50.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text(data,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
          icon: Icon(Icons.airplanemode_active,color: Colors.white,),
          backgroundColor: color,
          onPressed: () {
            setState(() {
              alignment == Alignment.center
                  ? alignment = Alignment.bottomCenter
                  : alignment = Alignment.center;

              alignment == Alignment.center
                  ? data = "Success . Ticket Booked!!"
                  : data = "Book Your Tickets Now ?";

              alignment == Alignment.center
                  ? color = Colors.teal
                  : color = Colors.blue;

              alignment == Alignment.center
                  ? appBarColor = Colors.teal
                  : appBarColor = Colors.blue;

              alignment == Alignment.center
                  ? iconColor = Colors.teal
                  : iconColor = Colors.blue;
            });
          },
        ),
      ),
    );
  }
}
var data = "Book Your Tickets Now ?";
var alignment = Alignment.bottomCenter;
var color = Colors.blue;
var iconColor = Colors.blue;
var appBarColor = Colors.blue;