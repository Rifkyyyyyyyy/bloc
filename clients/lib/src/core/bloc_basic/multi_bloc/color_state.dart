import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { toBlack, toGrey, toWhite }

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc(super.initialState);

  Color get initialState => Colors.black;


  Stream<Color> mapEventToState(ColorEvent event) async* {
    if (event == ColorEvent.toBlack) {
      yield Colors.black;
    } else if (event == ColorEvent.toGrey) {
      yield Colors.grey;
    } else if (event == ColorEvent.toWhite) {
      yield Colors.white;
    }
  }
}
