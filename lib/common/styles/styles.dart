import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

LinearGradient themeGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.orange,
    Colors.orangeAccent,
  ],
);

Container themeBackground = Container(
  decoration: BoxDecoration(
    gradient: themeGradient,
  ),
  child: Center(
    child: SpinKitRotatingCircle(
      color: Colors.white,
    ),
  ),
);