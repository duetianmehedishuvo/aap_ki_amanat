import 'package:aap_ki_amanat/ui/views/other_content_details_screen.dart';
import 'package:flutter/material.dart';


class OtherContentScreen extends StatefulWidget {
  List<dynamic> getAllData;
  String title;
  OtherContentScreen(this.getAllData,this.title);

  @override
  _OtherContentScreenState createState() => _OtherContentScreenState();
}

class _OtherContentScreenState extends State<OtherContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: widget.getAllData.length,
          itemBuilder: (context,index)=>Card(
            child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>OtherContentDetailsScreen(widget.getAllData[index])
                ));
              },
              title: Text('${widget.getAllData[index].title}'),
            ),
          )),
    );
  }
}
