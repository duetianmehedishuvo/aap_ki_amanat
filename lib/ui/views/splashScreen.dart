import 'dart:async';

import 'package:aap_ki_amanat_aap_ki_sei/ui/views/homeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static final route = '/launch';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.asset(
            'img/splash.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
