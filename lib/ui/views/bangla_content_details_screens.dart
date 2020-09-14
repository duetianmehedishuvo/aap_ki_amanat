import 'package:aap_ki_amanat/models/bangla.dart';
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
          Text('${bangla.description}'),
          Text(bangla.reference??"")
        ],
      ),
    );
  }
}
