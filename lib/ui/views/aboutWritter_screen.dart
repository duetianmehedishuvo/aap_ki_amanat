import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:flutter/material.dart';

class AboutWritterScreen extends StatelessWidget {
  final String description;

  AboutWritterScreen(this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResources.BACKGROUND,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorResources.COLOR_LANGUAGE,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'About Book Writer',
          style: TextStyle(fontFamily: '', color: ColorResources.COLOR_LANGUAGE),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "$description",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.normal, fontFamily: '', letterSpacing: 0.7, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
