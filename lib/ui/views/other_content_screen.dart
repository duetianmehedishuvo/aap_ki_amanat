
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/other_content_details_screen.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class OtherContentScreen extends StatelessWidget {
  List<dynamic> getAllData;
  String title;
  int languageType;

  OtherContentScreen(this.getAllData, this.title);

  String writerInfo;

  @override
  Widget build(BuildContext context) {
    if (title == 'Returning Your Trust')
      languageType = 0;
    else if (title == 'آپ کی خدمت میں')
      languageType = 1;
    else
      languageType = 2;

    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorResources.COLOR_LANGUAGE,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorResources.COLOR_LANGUAGE,
                          ),
                        ),
                        Text(
                          'Total Content : ${getAllData.length}',
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorResources.COLOR_LANGUAGE,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: ColorResources.COLOR_LANGUAGE,
                      ),
                      onPressed: () {
                        Share.share(Strings.SHARE_TEXT, subject: Strings.app_name);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.only(top: 5),
                color: ColorResources.BACKGROUND,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: getAllData.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => OtherContentDetailsScreen(getAllData[index], languageType)));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                                        getAllData[index].id % 2 == 0 ? ColorResources.COLOR_LANGUAGE.withOpacity(.9) : ColorResources.COLOR_LANGUAGE,
                                        getAllData[index].id % 2 == 0 ? ColorResources.COLOR_LANGUAGE : ColorResources.COLOR_LANGUAGE.withOpacity(.9),
                                        getAllData[index].id % 2 == 0 ? ColorResources.COLOR_LANGUAGE.withOpacity(.9) : ColorResources.COLOR_LANGUAGE,
                                      ])),
                                  child: Text(
                                    getAllData[index].id.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: ''),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  getAllData[index].title,
                                  style: TextStyle(
                                    fontFamily: '',
                                    color: ColorResources.COLOR_LANGUAGE,
                                  ),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset('img/books.png')
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
