
import 'package:aap_ki_amanat_aap_ki_sei/models/bangla.dart';
import 'package:aap_ki_amanat_aap_ki_sei/ui/views/bangla_content_details_screens.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:aap_ki_amanat_aap_ki_sei/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BanglaContentScreen extends StatelessWidget {
  final List<Bangla> banglaContents;

  BanglaContentScreen(this.banglaContents);

  @override
  Widget build(BuildContext context) {
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
                          'আপ কি আমানাত',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorResources.COLOR_LANGUAGE,
                          ),
                        ),
                        Text(
                          'মোট কন্টেন্ট : ${banglaContents.length} টি',
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
                    itemCount: banglaContents.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => BanglaContentDetailsScreen(banglaContents[index])));
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
                                      gradient: LinearGradient(begin: Alignment.topCenter,
                                          colors: [
                                        banglaContents[index].id % 2 == 0
                                            ? ColorResources.COLOR_LANGUAGE.withOpacity(.9)
                                            : ColorResources.COLOR_LANGUAGE,
                                        banglaContents[index].id % 2 == 0
                                            ? ColorResources.COLOR_LANGUAGE
                                            : ColorResources.COLOR_LANGUAGE.withOpacity(.9),
                                        banglaContents[index].id % 2 == 0
                                            ? ColorResources.COLOR_LANGUAGE.withOpacity(.9)
                                            : ColorResources.COLOR_LANGUAGE,
                                      ],

                                      )),
                                  child: Text(
                                    banglaContents[index].id.toString(),
                                    style: TextStyle(fontFamily: '', color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  banglaContents[index].title,
                                  style: TextStyle(
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
