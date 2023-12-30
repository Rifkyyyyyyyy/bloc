import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'belajar_bloc_event.dart';
part 'belajar_bloc_state.dart';

class BelajarBlocBloc extends Bloc<BelajarBlocEvent, BelajarBlocState> {
  BelajarBlocBloc() : super(BelajarBlocInitial()) {
    on<BelajarBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

