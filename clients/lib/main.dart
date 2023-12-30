import 'package:clients/src/basic/cubit/cubit_flutter.dart';
import 'package:clients/src/basic/stream/stream_flutter.dart';
import 'package:clients/src/bloc/belajar_bloc_bloc.dart';
import 'package:clients/src/pbo/implements/implements_flutter.dart';
import 'package:clients/src/view/view.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BelajarCubit(),
  ));
}
