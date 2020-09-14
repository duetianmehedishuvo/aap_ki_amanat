import 'package:aap_ki_amanat/models/bangla.dart';
import 'package:aap_ki_amanat/models/otherLanguage.dart';
import 'package:aap_ki_amanat/service/dbHelpers.dart';
import 'package:aap_ki_amanat/ui/views/bangla_content_screen.dart';
import 'package:aap_ki_amanat/ui/views/other_content_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DBHelpers dbHelpers=DBHelpers.instance;
  List<OtherLanguage> hindiContents=new List();
  List<OtherLanguage> urduContents=new List();
  List<OtherLanguage> englishContents=new List();
  List<Bangla> banglaContents=new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelpers.getAllBanglaContent().then((banglacontent){
      banglacontent.forEach((content) {
        banglaContents.add(Bangla.fromMap(content));
      });
    });
    dbHelpers.getAllEnglishContent().then((englishcontent){
      englishcontent.forEach((content) {
        englishContents.add(OtherLanguage.fromMap(content));
      });
    });
    dbHelpers.getAllHindiContent().then((hindicontent){
      hindicontent.forEach((content) {
        hindiContents.add(OtherLanguage.fromMap(content));
      });
    });
    dbHelpers.getAllUrduContent().then((urducontent){
      urducontent.forEach((content) {
        urduContents.add(OtherLanguage.fromMap(content));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Bangla Content'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>BanglaContentScreen(banglaContents)
              ));
            },
          ),
          RaisedButton(
            child: Text('English Content'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>OtherContentScreen(englishContents, 'English Content')
              ));
            },
          ),
          RaisedButton(
            child: Text('Hindi Content'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>OtherContentScreen(hindiContents, 'Hindi Content')
              ));
            },
          ),
          RaisedButton(
            child: Text('Urdu Content'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>OtherContentScreen(urduContents, 'Urdu Content')
              ));
            },
          ),
        ],
      ),
    );
  }
}
