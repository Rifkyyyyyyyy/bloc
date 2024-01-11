import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProductState extends Equatable {}

class InitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductAdd extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductAdded extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductError extends ProductState {
  final String err;
  @override
  List<Object> get props => [err];
  ProductError(this.err);
}

class ProductData extends ProductState {
  @override
  List<Object> get props => [];
}