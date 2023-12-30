import 'package:flutter/material.dart';

abstract mixin class Hello {
  String sayName();
}

abstract mixin class Back {
  String helloBack();
}

class Person with Hello, Back {
  String name;
  int age;
  String name2;

  Person({required this.name, required this.age, required this.name2});

  @override
  String sayName() {
    return 'Hello, my name is $name, and I am $age years old';
  }

  @override
  String helloBack() {
    return 'Hello to $name, nice to meet you. I am $name2';
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var people = <Person>[];

  @override
  void initState() {
    super.initState();
    all();
  }

  void all() {
    for (var i = 0; i < namaOrang.length; i++) {
      var person = Person(
          name: namaOrang[i]["nama"],
          age: namaOrang[i]["age"],
          name2: namaOrang[i]["nama2"]);
      people.add(person);
    }
  }

  List<Map<String, dynamic>> namaOrang = [
    {"nama": "rifky", "age": 19, "nama2": "ririn"},
    {"nama": "rifky 2", "age": 29, "nama2": "ririn2"},
    {"nama": "rifky 3", "age": 39, "nama2": "ririn3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: people.map((person) {
            return ListTile(
              title: Text(person.sayName()),
              subtitle: Text(person.helloBack()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
