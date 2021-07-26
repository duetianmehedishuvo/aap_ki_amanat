import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:flutter/material.dart';

class HomeCategoryBtnWidget extends StatelessWidget {
  final Function onTap;
  final String title;
  final String languageName;
  final String imageUrl;
  final Color color;

  HomeCategoryBtnWidget({this.onTap, this.title, this.imageUrl, this.color, this.languageName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.all(0),
      child: Container(
        height: 130,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorResources.COLOR_WHITE,
                fontSize: 17,
                fontFamily: '',
                fontWeight: FontWeight.w500,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: languageName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: '',
                        color: ColorResources.COLOR_BANGLA,
                      )),
                  TextSpan(text: '⋙', style: TextStyle(fontSize: 14)),
                  //TextSpan(text: ' world!'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
