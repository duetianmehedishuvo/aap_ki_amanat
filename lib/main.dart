import 'package:aap_ki_amanat_aap_ki_sei/ui/views/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aap Ki Amanat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'kalpurus',
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
