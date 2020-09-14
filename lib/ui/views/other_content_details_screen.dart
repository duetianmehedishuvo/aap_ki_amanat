import 'package:aap_ki_amanat/models/otherLanguage.dart';
import 'package:flutter/material.dart';

class OtherContentDetailsScreen extends StatelessWidget {

  final OtherLanguage otherLanguage;
  OtherContentDetailsScreen(this.otherLanguage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${otherLanguage.title}'),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10,left: 2,right: 2),
              color: Colors.white,
              child: Text('${otherLanguage.description}',style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.6,
              ),)),
        ],
      ),
    );
  }
}
