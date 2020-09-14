import 'package:aap_ki_amanat/models/bangla.dart';
import 'package:aap_ki_amanat/ui/views/bangla_content_details_screens.dart';
import 'package:flutter/material.dart';

class BanglaContentScreen extends StatelessWidget {

  final List<Bangla> banglaContents;
  BanglaContentScreen(this.banglaContents);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('আপ কি আমানত'),
      ),
      body: ListView.builder(
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
    );
  }
}
