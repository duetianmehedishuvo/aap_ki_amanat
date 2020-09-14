import 'package:aap_ki_amanat/models/bangla.dart';
import 'package:aap_ki_amanat/ui/views/bangla_content_details_screens.dart';
import 'package:flutter/material.dart';

class BanglaContentScreen extends StatelessWidget {

  final List<Bangla> banglaContents;
  BanglaContentScreen(this.banglaContents);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('img/bangla.png',
              width: double.infinity,
              fit: BoxFit.fill,
              height: 250,),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              maxChildSize: 0.8,
              builder: (context,controller){
                return Container(
                  child: ListView.builder(
                      itemCount: banglaContents.length,
                      itemBuilder: (context,index)=>Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>BanglaContentDetailsScreen(banglaContents[index])
                            ));
                          },
                          title: Text('${banglaContents[index].title}'),
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
                child: Icon(Icons.keyboard_backspace,color: Colors.green,),
                highlightColor: Colors.green.withOpacity(.5),
              ),
            ),
            Positioned(
              top: 5,
              right: -15,
              child: FlatButton(
                onPressed: (){

                },
                child: Icon(Icons.share,color: Colors.green,),
                highlightColor: Colors.green.withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
