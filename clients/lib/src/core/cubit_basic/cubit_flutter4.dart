import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Person extends Cubit<String> {
  String? name;
  Person({this.name}) : super(name ?? "MEONG");

  String checkConstructor() {
    // emit('hello $state');
    return 'Hello ${state.toString()}';
  }
}

class CheckConstructor extends StatefulWidget {
  const CheckConstructor({super.key});

  @override
  State<CheckConstructor> createState() => _CheckConstructorState();
}

class _CheckConstructorState extends State<CheckConstructor> {
  Person person = Person();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(person.checkConstructor()),
            // Text(person.name!)
          ],
        ),
      ),
    );
  }
}
