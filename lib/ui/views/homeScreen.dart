import 'dart:io';

import 'package:aap_ki_amanat_aap_ki_sei/models/bangla.dart';
import 'package:aap_ki_amanat_aap_ki_sei/models/otherLanguage.dart';
import 'package:aap_ki_amanat_aap_ki_sei/service/dbHelpers.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/aboutDeveloper_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/bangla_content_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/other_content_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/pdf_preview_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/widget/home_category_btn_widget.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/strings.dart';
import 'package:deivao_drawer/deivao_drawer.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelpers dbHelpers = DBHelpers.instance;
  List<OtherLanguage> hindiContents = [];
  List<OtherLanguage> englishContents = [];
  List<Bangla> banglaContents = [];
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
    dbHelpers.getAllBanglaContent().then((banglacontent) {
      banglacontent.forEach((content) {
        banglaContents.add(Bangla.fromMap(content));
      });
    });
    dbHelpers.getAllEnglishContent().then((englishcontent) {
      englishcontent.forEach((content) {
        englishContents.add(OtherLanguage.fromMap(content));
      });
    });
    dbHelpers.getAllHindiContent().then((hindicontent) {
      hindicontent.forEach((content) {
        hindiContents.add(OtherLanguage.fromMap(content));
      });
    });
  }

  Widget _appBar() {
    return Container(
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                Strings.app_name,
                style: TextStyle(
                  fontSize: 18.0,
                  color: ColorResources.COLOR_LANGUAGE,
                  fontWeight: FontWeight.bold,
                  fontFamily: '',
                ),
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: ColorResources.COLOR_LANGUAGE,
                ),
                onSelected: (value) {
                  print(value.toString());
                },
                // initialValue: choices[_selection],
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                      value: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            color: ColorResources.BACKGROUND.withOpacity(.4),
                          ),
                          Container(
                            child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutDeveloperScreen()));
                                },
                                title: Text(
                                  Strings.ABOUT_DEVELOPER,
                                  style: TextStyle(
                                    fontFamily: '',
                                    color: ColorResources.COLOR_LANGUAGE,
                                  ),
                                )),
                          ),
                          Container(
                            height: 1,
                            color: ColorResources.BACKGROUND.withOpacity(.4),
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      value: 1,
                      child: Column(
                        children: [
                          Container(
                            child: ListTile(
                                onTap: () {
                                  Share.share(Strings.SHARE_TEXT, subject: Strings.app_name);
                                },
                                title: Text(
                                  Strings.SHARE,
                                  style: TextStyle(
                                    fontFamily: '',
                                    color: ColorResources.COLOR_LANGUAGE,
                                  ),
                                )),
                          ),
                          Container(
                            height: 1,
                            color: ColorResources.BACKGROUND.withOpacity(.4),
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      value: 2,
                      child: Column(
                        children: [
                          Container(
                            child: ListTile(
                                onTap: () {
                                  _launchPlayStore();
                                },
                                title: Text(
                                  Strings.MORE_APPS,
                                  style: TextStyle(
                                    fontFamily: '',
                                    color: ColorResources.COLOR_LANGUAGE,
                                  ),
                                )),
                          ),
                          Container(
                            height: 1,
                            color: ColorResources.BACKGROUND.withOpacity(.4),
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      value: 3,
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                            Strings.VERSION2,
                            style: TextStyle(
                              fontFamily: '',
                              color: ColorResources.COLOR_LANGUAGE.withOpacity(.5),
                            ),
                          )),
                          Container(
                            height: 1,
                            color: ColorResources.BACKGROUND.withOpacity(.4),
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // ignore: missing_return
        Toast.show(Strings.BACKBUTTON_TOAST_STRINGS, context,
            duration: Toast.LENGTH_SHORT, backgroundColor: Colors.green, gravity: Toast.BOTTOM);
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: ColorResources.BACKGROUND,
            child: ListView(
              children: [
                PreferredSize(
                  child: _appBar(),
                  preferredSize: Size(MediaQuery.of(context).size.width, 120),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  padding: EdgeInsets.all(10),
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    Strings.CHOSE_YOUR_LANGUAGE,
                    style: TextStyle(
                      fontFamily: '',
                      color: ColorResources.COLOR_LANGUAGE,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 20,
                  ),
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(color: ColorResources.COLOR_LANGUAGE.withOpacity(.5), borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 50,
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeCategoryBtnWidget(
                          title: Strings.NAME_BANGLA,
                          languageName: Strings.READ_BANGLA,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BanglaContentScreen(banglaContents)));
                          },
                          color: ColorResources.COLOR_YELLOW_SEA,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: HomeCategoryBtnWidget(
                          title: Strings.NAME_ENGLISH,
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => OtherContentScreen(englishContents, 'Returning Your Trust')));
                          },
                          languageName: Strings.READ_ENGLISH,
                          color: ColorResources.COLOR_ENGLISH,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 20,
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeCategoryBtnWidget(
                          title: 'آپ کی خدمت میں     ',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfPreviewScreen()));
                          },
                          languageName: 'Read Urdu',
                          color: ColorResources.COLOR_RED,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: HomeCategoryBtnWidget(
                          title: 'आप की अमानत आपकी सेवा में',
                          languageName: 'Read Hindi',
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => OtherContentScreen(hindiContents, 'आप की अमानत आपकी सेवा में')));
                          },
                          color: ColorResources.COLOR_HINDI,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 10, right: 2),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(28)),
                            child: Text(
                              Strings.EXIT,
                              style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: ''),
                            )),
                      ),
                      TextButton(
                        onPressed: () {
                          Share.share(Strings.SHARE_TEXT, subject: Strings.app_name);
                        },
                        child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 10, right: 2),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(28)),
                            child: Text(
                              Strings.SHARE,
                              style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: ''),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
