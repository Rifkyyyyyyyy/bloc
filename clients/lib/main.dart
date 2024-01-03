import 'package:clients/src/basic/bloc_basic/bloc_builder.dart';
import 'package:clients/src/basic/stream/stream_builder.dart';
import 'package:clients/src/basic/cubit_basic/cubit_flutter.dart';
import 'package:clients/src/basic/cubit_basic/cubit_flutter2.dart';
import 'package:clients/src/basic/cubit_basic/cubit_flutter3.dart';
import 'package:clients/src/basic/cubit_basic/cubit_flutter4.dart';
import 'package:clients/src/basic/cubit_basic/cubit_mastering.dart';
import 'package:clients/src/basic/stream/stream_flutter.dart';
import 'package:clients/src/bloc/belajar_bloc_bloc.dart';
import 'package:clients/src/pbo/implements/implements_flutter.dart';
import 'package:clients/src/view/view.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:   BelajarBlocBuilder(), 
    ),
  );
}
