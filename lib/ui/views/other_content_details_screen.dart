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
          Text('${otherLanguage.description}')
        ],
      ),
    );
  }
}
