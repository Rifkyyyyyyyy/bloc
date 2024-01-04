import 'package:clients/src/core/bloc_basic/bloc_builder.dart';
import 'package:clients/src/core/cubit_basic/cubit_state.dart';
import 'package:clients/src/core/stream/stream_builder.dart';
import 'package:clients/src/core/cubit_basic/cubit_flutter.dart';
import 'package:clients/src/core/cubit_basic/cubit_flutter2.dart';
import 'package:clients/src/core/cubit_basic/cubit_flutter3.dart';
import 'package:clients/src/core/cubit_basic/cubit_flutter4.dart';
import 'package:clients/src/core/cubit_basic/cubit_mastering.dart';
import 'package:clients/src/core/stream/stream_flutter.dart';
import 'package:clients/src/pbo/implements/implements_flutter.dart';
import 'package:clients/src/view/view.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Tambahkan>(
      create: (ctx) => Tambahkan(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilderBelajar(),
      ),
    );
  }
}