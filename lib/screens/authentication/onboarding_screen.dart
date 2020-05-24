import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:revidlytest/common/styles/styles.dart';
import 'package:revidlytest/enums/connectivity_status.dart';
import 'package:revidlytest/screens/authentication/wrapper.dart';
import 'package:revidlytest/screens/home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    Timer _timer = Timer(const Duration(milliseconds: 250), onCloseDialog);
  }

  void onCloseDialog() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) =>  Wrapper(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: themeGradient,
        ),
        child: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
