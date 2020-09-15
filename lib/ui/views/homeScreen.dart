import 'dart:io';

import 'package:aap_ki_amanat/models/bangla.dart';
import 'package:aap_ki_amanat/models/otherLanguage.dart';
import 'package:aap_ki_amanat/service/dbHelpers.dart';
import 'package:aap_ki_amanat/ui/views/aboutDeveloper_screen.dart';
import 'package:aap_ki_amanat/ui/views/aboutWritter_screen.dart';
import 'package:aap_ki_amanat/ui/views/bangla_content_screen.dart';
import 'package:aap_ki_amanat/ui/views/other_content_screen.dart';
import 'package:aap_ki_amanat/utils/utils.dart';
import 'package:deivao_drawer/deivao_drawer.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final drawerController = DeivaoDrawerController();

  _launchPlayStore() async {
    const url = 'https://play.google.com/store/apps/developer?id=DUETianmehedishuvo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



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

  Widget _appBar(){
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: Container(
          height:70,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child:
          Row(
            children: <Widget>[
              IconButton(
                icon:Icon(Icons.menu,color: Colors.green,),
                onPressed: drawerController.toggle,

              ),
              //Text(englishDate,style: TextStyle(color:Color(0xff06AB00), fontSize: 17)),

              Text('Aap Ki Amanat',style: TextStyle(fontSize: 18.0,color: Colors.green,fontWeight: FontWeight.bold,fontFamily: ''),),
            ],
          ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DeivaoDrawer(
      controller: drawerController,
      drawer: _buildDrawer(context),
      child: DefaultTabController(
        length: 9,
        child: WillPopScope(
          onWillPop: (){
            print('Close');
          },
          child: SafeArea(
            child: Scaffold(
              appBar: PreferredSize(child: _appBar(),
                preferredSize: Size(MediaQuery.of(context).size.width, 120),) ,
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 2),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))
                    ),
                    child: FlatButton(
                      child: Text('Introduce Maulana Muhammed Kaleem Siddiqui.',
                        style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: '',fontWeight: FontWeight.normal),),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>AboutWritterScreen(englishWritterInfo)
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10,right: 2),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.3),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text('Please Select a Language',style: TextStyle(fontFamily: '',fontSize: 18),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(left: 50,right: 2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))
                    ),
                    child: ListTile(
                      title: Text('আপনার সমীপে আপনার আমানাত',style: TextStyle(color: Colors.white,fontSize: 18),),
                      subtitle: Text('Language: Bangla',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: ''),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>BanglaContentScreen(banglaContents)
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(left: 50,right: 2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))
                    ),
                    child: ListTile(
                      title: Text('Returning Your Trust',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: ''),),
                      subtitle: Text('Language: English',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: ''),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>OtherContentScreen(englishContents, 'English')
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(left: 50,right: 2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))
                    ),
                    child: ListTile(
                      title: Text('آپ کی خدمت میں',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: ''),),
                      subtitle: Text('Language: Urdu',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: ''),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>OtherContentScreen(urduContents, 'Urdu Content')
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(left: 50,right: 2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))
                    ),
                    child: ListTile(
                      title: Text('आप की अमानत आपकी सेवा में',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: ''),),
                      subtitle: Text('Language: Hindi',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: ''),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>OtherContentScreen(hindiContents, 'Hindi')
                        ));
                      },
                    ),
                  ),

                  SizedBox(height: 5,),
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10,right: 2),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.3),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: FlatButton(
                        onPressed: (){
                          Share.share('This is a wonderful Apps describing the major concepts and fundamentals of Islam, ideal for non muslims seeking for an introduction to Islam and to understand what are the core differences in beliefs! Download This Application here https://play.google.com/store/apps/developer?id=DUETianmehedishuvo', subject: 'Aap Ki Amanat');
                        },
                        child: Text('Share Now',style: TextStyle(
                          fontFamily: '',
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                        ),)),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10,right: 2),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed:(){
                          exit(0);
                  },
                          child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 10,right: 2),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Text('Exit Now',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: ''),)),
                        ),
                        FlatButton(
                          onPressed: _launchPlayStore,
                          child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 10,right: 2),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Text('Feedback',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: ''),)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildDrawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50, bottom: 20),
          color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "img/islam.png",
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Aap ki Amanat \nAap ki Sewa mein ',
                style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: 'Roboto'),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>HomeScreen()
                ));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.home,color: Colors.white,),
              ),
              title: Text("Home",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>BanglaContentScreen(banglaContents)
                ));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.language,color: Colors.white,),
              ),
              title: Text("Read Bangla Language",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>OtherContentScreen(englishContents, 'English')
                ));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.language,color: Colors.white,),
              ),
              title: Text("Read English Language",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>OtherContentScreen(urduContents, 'Urdu Content')
                ));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.language,color: Colors.white,),
              ),
              title: Text("Read Urdu Language",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>OtherContentScreen(hindiContents, 'Hindi')
                ));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.language,color: Colors.white.withOpacity(.9),),
              ),
              title: Text("Read Hindi Language",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.9),
          child: ListTile(
              title: Text("Application Preferences",style: TextStyle(fontFamily: '',color: Colors.white),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>AboutDeveloperScreen()
                ));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.info,color: Colors.white,),
              ), title: Text("About Developer",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
                Share.share('This is a wonderful Apps describing the major concepts and fundamentals of Islam, ideal for non muslims seeking for an introduction to Islam and to understand what are the core differences in beliefs! Download This Application here https://play.google.com/store/apps/developer?id=DUETianmehedishuvo', subject: 'Aap Ki Amanat');
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.share,color: Colors.white,),
              ), title: Text("Share",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.5),
          child: ListTile(
              onTap: (){
               _launchPlayStore();
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.more,color: Colors.white,),
              ), title: Text("More Apps",style: TextStyle(fontFamily: ''),)),
        ),
        Container(
          height: 1,
          color: Colors.green.withOpacity(.4),
        ),
        Container(
          color: Colors.green.withOpacity(.9),
          child: ListTile(
              title: Text("Version 1.0.0",style: TextStyle(fontFamily: '',color: Colors.white),)),
        ),
        Container(
          height: 200,
          color: Colors.green.withOpacity(.4),
        ),
      ],
    );
  }
}
