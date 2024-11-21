import 'package:animation_daily_task/View/hero.dart';
import 'package:flutter/material.dart';

class HeroAnimation2 extends StatefulWidget {
  final int index;
  const HeroAnimation2({super.key, required this.index});

  @override
  State<HeroAnimation2> createState() => _HeroAnimation2State();
}

class _HeroAnimation2State extends State<HeroAnimation2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.black,
        title: Text(animalName[widget.index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.index,
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(animalPhoto[widget.index],
                    ),),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(animalName[widget.index],
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500,color: Colors.white),),
            SizedBox(height: 10,),
            Text(
              animalDescription[widget.index], style: TextStyle(fontSize: 14,color: Colors.grey.shade400),
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
