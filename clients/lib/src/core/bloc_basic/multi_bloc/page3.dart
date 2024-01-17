import 'package:clients/src/core/bloc_basic/multi_bloc/page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyPage2 extends StatelessWidget {
  const MyPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '0',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, shape: StadiumBorder()),
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
