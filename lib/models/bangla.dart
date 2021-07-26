class Bangla {
  int id;
  String title, description, reference;

  Bangla({this.id, this.title, this.description, this.reference});

  Bangla.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    title = map['TITLE'];
    description = map['DESCRIPTION'];
    reference = map['REFERENCES'];
  }
}
