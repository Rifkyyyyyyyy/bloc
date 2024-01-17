import 'package:equatable/equatable.dart';

abstract class SubmissionEvent extends Equatable {}

class CreateTicket extends SubmissionEvent{
  final String judul;
  final String genre;
  final double durasi;

  CreateTicket(
      {required this.judul, required this.genre, required this.durasi});

  @override
  List<Object> get props => [judul, genre, durasi];
}
