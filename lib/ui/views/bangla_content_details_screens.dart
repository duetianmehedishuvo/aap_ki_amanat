import 'package:aap_ki_amanat/models/bangla.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BanglaContentDetailsScreen extends StatelessWidget {
  final Bangla bangla;
  BanglaContentDetailsScreen(this.bangla);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${bangla.title}'),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10,left: 2,right: 2),
              color: Colors.white,
              child: Text('${bangla.description}',style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.6,
              ),)),
          Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(bangla.reference??"",style: TextStyle(
                color: Colors.black38,
              ),))
        ],
      ),
    );
  }
}
