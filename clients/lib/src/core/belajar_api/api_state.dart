import 'package:clients/src/utils/model/users_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ApiState extends Equatable {}

class LoadingState extends ApiState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ApiState {
  final List<UserModel> usermodel;

  LoadedState({required this.usermodel});

  @override
  List<Object?> get props => [usermodel];
}

class ErrorState extends ApiState {
  final String err;

  ErrorState(this.err);

  @override
  List<Object?> get props => [err];
}
