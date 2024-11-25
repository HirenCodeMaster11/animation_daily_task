import 'package:animation_daily_task/View/airoplane.dart';
import 'package:animation_daily_task/View/game.dart';
import 'package:animation_daily_task/View/hero.dart';
import 'package:animation_daily_task/View/rotation.dart';
import 'package:flutter/material.dart';

import 'View/hii.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlanetRotation(),
    );
  }
}
