import 'package:flutter/material.dart';

class BelajarStream extends StatefulWidget {
  const BelajarStream({super.key});

  @override
  State<BelajarStream> createState() => _BelajarStreamState();
}

class _BelajarStreamState extends State<BelajarStream> {
  Stream<int> myStream() async* {
    int start = 0;
    while (start < 20) {
      await Future.delayed(Duration(seconds: 1), () => start++);
      yield start;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: myStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('nunggu dulu bang' , style: TextStyle(
                fontSize: 20
              ),));
            } else {
              return Container(
                child: Center(
                  child: Text(snapshot.data.toString() , style: TextStyle(
                    fontSize: 20
                  ),),
                ),
              );
            }
          }),
    );
  }
}
