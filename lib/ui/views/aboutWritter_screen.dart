import 'package:flutter/material.dart';

class AboutWritterScreen extends StatelessWidget {
  final String description;
  AboutWritterScreen(this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Book Writer'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$description",style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: '',
              letterSpacing: 0.7,
              fontSize: 18
            ),),
          )
        ],
      ),
    );
  }
}
