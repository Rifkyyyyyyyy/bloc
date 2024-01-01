import 'package:clients/src/basic/cubit/cubit_flutter.dart';
import 'package:clients/src/basic/cubit/cubit_flutter2.dart';
import 'package:clients/src/basic/cubit/cubit_flutter3.dart';
import 'package:clients/src/basic/cubit/cubit_flutter4.dart';
import 'package:clients/src/basic/cubit/cubit_mastering.dart';
import 'package:clients/src/basic/stream/stream_flutter.dart';
import 'package:clients/src/bloc/belajar_bloc_bloc.dart';
import 'package:clients/src/pbo/implements/implements_flutter.dart';
import 'package:clients/src/view/view.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
void main(List<String> args) {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
   
  home: BelajarCubit4(dataOrang: DataOrang()),
  ));
}
