import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Create extends ProductsEvent {
  final String name;
  final String price;
  final String image;
  final String description;

  Create({required this.name, required this.price , required this.image , required this.description});
}
