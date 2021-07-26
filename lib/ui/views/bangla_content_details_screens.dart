
import 'package:aap_ki_amanat_aap_ki_sei/models/bangla.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/aboutWritter_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BanglaContentDetailsScreen extends StatelessWidget {
  final Bangla bangla;

  BanglaContentDetailsScreen(this.bangla);

  @override
  Widget build(BuildContext context) {
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutWritterScreen(banglaWritterInfo)));
                    },
                    child: Container(
                      width: 120,
                      height: 45,
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ], color: ColorResources.COLOR_LANGUAGE, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'লেখক পরিচিতি',
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: SelectableText(
                          '${bangla.description}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.6,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: bangla.reference != '' ? Colors.white : Colors.white.withOpacity(.1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: SelectableText(
                          bangla.reference ?? "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ))
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
