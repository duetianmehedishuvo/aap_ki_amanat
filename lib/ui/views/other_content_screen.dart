import 'package:aap_ki_amanat/ui/views/other_content_details_screen.dart';
import 'package:flutter/material.dart';


class OtherContentScreen extends StatelessWidget{
  List<dynamic> getAllData;
  String title;
  OtherContentScreen(this.getAllData,this.title);
  String imageUrl='';
  
  @override
  Widget build(BuildContext context) {
    if(title=='English') imageUrl='img/english.png';
    else if(title=='Hindi') imageUrl='img/hindi.png';
    else imageUrl='img/urdu.png';

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(imageUrl,
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
                      itemCount: getAllData.length,
                      itemBuilder: (context,index)=>Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>OtherContentDetailsScreen(getAllData[index])
                            ));
                          },
                          title: Text('${getAllData[index].title}'),
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
