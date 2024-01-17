import 'package:clients/src/utils/model/user_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BiodataState extends Equatable {}

class BiodataInitial extends BiodataState {
  @override
  List<Object> get props => [];
}

class DataBiodata extends BiodataState {
  final List<Biodata> biodata;
  DataBiodata({required this.biodata});
  @override
  List<Object> get props => [biodata];
}
