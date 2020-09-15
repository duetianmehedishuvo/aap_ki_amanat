import 'dart:io';

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
    const url = 'mailto:duetinmehedishuvo@gmail.com?';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchWhatsApp({@required String phone, @required String message,}) async {
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
      appBar: AppBar(
        title: Text('About Developer'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text('Assalamu alaikum. Then I offer Durood to our world-prophet Hazrat Muhammad SAW.\nThen\nI am Md. Mehedi Hasan Shuvo. My home is Kalkini, Madaripur and I am a Bangladeshi. I am currently studying in the Computer Science Department at Dhaka University & Engineering Technology. In fact, no one has come to live in this world, one day everyone will have to leave and after death, only 3 things will go to this grave, 1 of them is charity. There are no Adds in these apps. I have no desire to earn income through these apps. All I have to do is deliver these apps to infidels (especially Hindu brothers). Everyone will pray for me, this is my request to you. May Allah guide me and guide everyone. May Allah grant the infidels the grace to understand Islam. Amen.',style: TextStyle(fontSize: 18,
                letterSpacing: 0.7,
                fontFamily: ''),),
          ),

          Container(
            margin: EdgeInsets.only(left: 10,right: 22),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))
            ),
            child: FlatButton(
              child: Row(
                children: [
                  Image.asset('img/fb.png',width: 25,height: 25,),
                  Text('   Connect With Facebook',style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
              onPressed: (){
                _launchFacebook();
              },
            ),
          ),
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.only(left: 10,right: 22),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))
            ),
            child: FlatButton(
              child: Row(
                children: [
                  Image.asset('img/whatsapp.png',width: 25,height: 25,),
                  Text('   Connect With WhatsApp',style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
              onPressed: (){
                launchWhatsApp(phone: '01303129515', message: 'Aap ki Amanat');
              },
            ),
          ),
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.only(left: 10,right: 22),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))
            ),
            child: FlatButton(
              child: Row(
                children: [
                  Image.asset('img/email.png',width: 25,height: 25,),
                  Text('   Connect With Email',style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
              onPressed: (){
                _launchEmai();
              },
            ),
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
