
import 'package:aap_ki_amanat_aap_ki_sei/models/otherLanguage.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/aboutWritter_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/utils.dart';
import 'package:flutter/material.dart';

class OtherContentDetailsScreen extends StatelessWidget {
  final OtherLanguage otherLanguage;
  final int languageType;

  OtherContentDetailsScreen(this.otherLanguage, this.languageType);

  @override
  Widget build(BuildContext context) {
    String writterInfo = '';

    if (languageType == 0)
      writterInfo = englishWritterInfo;
    else if (languageType == 1)
      writterInfo = urduWritterInfo;
    else
      writterInfo = hindiWritterInfo;

    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              color: ColorResources.BACKGROUND,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 35,
                      height: 45,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_LANGUAGE,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(18))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: ColorResources.COLOR_WHITE,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutWritterScreen(writterInfo)));
                    },
                    child: Container(
                      width: 120,
                      height: 45,
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: ColorResources.COLOR_LANGUAGE,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Writer Info',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: ''),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: ColorResources.BACKGROUND,
                padding: EdgeInsets.all(5),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: SelectableText(
                          '${otherLanguage.description}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 20, fontFamily: ''),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
