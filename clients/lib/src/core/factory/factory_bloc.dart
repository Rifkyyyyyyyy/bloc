import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_event.dart';
part 'factory_state.dart';
part 'factory_bloc.freezed.dart';

class StateBloc extends Bloc<CounterEvent, CounterState> {
  StateBloc() : super(const _CounterInitial()) {
    on<CounterEvent>((event, emit) {
      emit(state.when(
          factoryInitial: () => const CounterState.running(0),
          running: (bilangan) {
           return event.when(
                increment: () => CounterState.running(bilangan + 1),
                decrement: () => CounterState.running(bilangan > 0 ? bilangan - 1 : bilangan));
          }));
    });
  }
}
