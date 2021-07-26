import 'dart:io';


import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloperScreen extends StatelessWidget {
  _launchFacebook() async {
    const url = 'https://www.facebook.com/m.mehedihasanshuvo.in';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmai() async {
    const url = 'mailto:duetianmehedishuvo@gmail.com?';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

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
          'About Developer',
          style: TextStyle(
            fontFamily: '',
            color: ColorResources.COLOR_LANGUAGE,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              Strings.MY_INFO,
              style: TextStyle(fontSize: 18, letterSpacing: 0.7, fontFamily: '', color: ColorResources.COLOR_LANGUAGE),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 22,
              top: 20,
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))),
            child: TextButton(
              child: Row(
                children: [
                  Image.asset(
                    'img/fb.png',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    Strings.CONNECT_WITH_FACEBOOK,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              onPressed: () {
                _launchFacebook();
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 22),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))),
            child: TextButton(
              child: Row(
                children: [
                  Image.asset(
                    'img/whatsapp.png',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    Strings.CONNECT_WITH_WHATSAPP,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              onPressed: () {
                launchWhatsApp(phone: Strings.MY_NUMBER, message: Strings.app_name);
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 22),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))),
            child: TextButton(
              child: Row(
                children: [
                  Image.asset(
                    'img/email.png',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    Strings.CONNECT_WITH_EMAIL,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              onPressed: () {
                _launchEmai();
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
