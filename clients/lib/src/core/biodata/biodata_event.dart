import 'package:equatable/equatable.dart';

abstract class BiodataEvent extends Equatable {}

class CreateData extends BiodataEvent {
  final String nama;
  final int umur;

  CreateData({required this.nama, required this.umur});
  @override
  List<Object> get props => [nama, umur];
}
