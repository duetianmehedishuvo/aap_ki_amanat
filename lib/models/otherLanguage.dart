class OtherLanguage{
  int id;
  String title,description;

  OtherLanguage({this.id, this.title, this.description});

  OtherLanguage.fromMap(Map<String,dynamic> map){
    id=map['ID'];
    title=map['TITLE'];
    description=map['DESCRIPTION'];
  }
}