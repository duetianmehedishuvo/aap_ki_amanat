import 'package:aap_ki_amanat/ui/views/other_content_details_screen.dart';
import 'package:aap_ki_amanat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'aboutWritter_screen.dart';


class OtherContentScreen extends StatelessWidget{
  List<dynamic> getAllData;
  String title;
  OtherContentScreen(this.getAllData,this.title);
  String imageUrl='';
  String writerInfo;
  
  @override
  Widget build(BuildContext context) {
    if(title=='English'){
      imageUrl='img/english.png';
      writerInfo=englishWritterInfo;
    }
    else if(title=='Hindi') {
      imageUrl='img/hindi.png';
      writerInfo=hindiWritterInfo;
    }
    else {
      imageUrl='img/urdu.png';
      writerInfo=urduWritterInfo;
    }

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Image.asset(imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 250,),
                Container(
                  width: double.infinity,
                  height: 250,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>AboutWritterScreen(writerInfo)
                      ));
                    },
                    child: Text(''),
                  ),
                ),

              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              maxChildSize: 0.8,
              builder: (context,controller){
                return Container(
                  child: ListView.builder(
                      itemCount: getAllData.length,
                      itemBuilder: (context,index)=>Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>OtherContentDetailsScreen(getAllData[index])
                            ));
                          },
                          title: Text('${getAllData[index].title}',style: TextStyle(fontFamily: '',fontWeight: FontWeight.normal),),
                        ),
                      )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                );
              },
            ),
            Positioned(
              top: 5,
              left: -15,
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                highlightColor: Colors.green.withOpacity(.5),
                child: Icon(Icons.keyboard_backspace,color: Colors.green,),
              ),
            ),
            Positioned(
              top: 5,
              right: -15,
              child: FlatButton(
                onPressed: (){
                  Share.share('This is a wonderful Apps describing the major concepts and fundamentals of Islam, ideal for non muslims seeking for an introduction to Islam and to understand what are the core differences in beliefs! Download This Application here https://play.google.com/store/apps/developer?id=DUETianmehedishuvo', subject: 'Aap Ki Amanat');
                },
                highlightColor: Colors.green.withOpacity(.5),
                child: Icon(Icons.share,color: Colors.green,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
