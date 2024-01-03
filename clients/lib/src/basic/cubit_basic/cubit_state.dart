import 'package:flutter_bloc/flutter_bloc.dart';

class Sample extends Cubit<int> {
  int num;
  Sample({required this.num}) : super(0);

  void increments() {
    if (num > 0) {
      emit(state + 1);
    }
  }

  void decrement() {
    emit(state - 1);
  }
}
