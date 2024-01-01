import 'package:flutter_bloc/flutter_bloc.dart';

mixin Charachter {
  int? hp;
  int? heal;
  int? damage;
}

class Player with Charachter {
  String? playerName;
}

class Monster with Charachter {
  String? monsterName;
}

// class Leveling extends Cubit<Charachter> {
//   Leveling() : super();
// }
