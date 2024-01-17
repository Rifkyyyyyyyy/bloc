class Biodata {
  String name;
  int age;
  Biodata({required this.name, required this.age});

  factory Biodata.asMap(Map<String, dynamic> data) {
    return Biodata(name: data['name'], age: data['age']);
  }
}
