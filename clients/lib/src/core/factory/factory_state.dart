part of 'factory_bloc.dart';



@freezed
class CounterState with _$CounterState {
  const factory CounterState.factoryInitial() = _CounterInitial;
  const factory CounterState.running(int i) = _Running;
}

//  class FactoryInitial extends FactoryState {}

