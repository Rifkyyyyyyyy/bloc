import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;
  const MyPage({super.key, required this.backgroundColor , required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text('flutter bloc multipage'),
      ),
      body: body,
    );
  }
}
