import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SubmissionState extends Equatable {}

class SubmissionInitial extends SubmissionState {
  @override
  List<Object> get props => [];
}

class TicketCreate extends SubmissionState {
  @override
  List<Object> get props => [];
}
