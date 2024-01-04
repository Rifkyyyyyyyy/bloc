import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Character {
  int? hp;
  int? heal;
  Character({this.hp, this.heal});
}

class PlayerInfo extends Character {
  String? name;
  int? damage;

  PlayerInfo({this.name, this.damage, int? hp, int? heal})
      : super(hp: hp, heal: heal);
}

class MonsterInfo extends Character {
  String? monsterName;
  int? damage;

  MonsterInfo({this.monsterName, this.damage, int? hp, int? heal})
      : super(hp: hp, heal: heal);
}

class Detail extends Cubit<Character> {
  String? name;
  String? monsterName;
  int? damage;

  Detail({this.name, this.monsterName, this.damage, int? hp, int? heal})
      : super(PlayerInfo(name: name, damage: damage, hp: hp, heal: heal));

  // void updatePlayerInfo(String name, int damage, int hp, int heal) {
  //   emit(PlayerInfo(name: name, damage: damage, hp: hp, heal: heal));
  // }

  // void updateMonsterInfo(String monsterName, int damage, int hp, int heal) {
  //   emit(MonsterInfo(monsterName: monsterName, damage: damage, hp: hp, heal: heal));
  // }
}

class SimpleGame extends StatefulWidget {
  const SimpleGame({Key? key}) : super(key: key);

  @override
  State<SimpleGame> createState() => _SimpleGameState();
}

class _SimpleGameState extends State<SimpleGame> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Detail(),
      child: Scaffold(
        body: BlocBuilder<Detail, Character>(
          builder: (context, character) {
            return SafeArea(
              top: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Character Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  if (character is PlayerInfo) ...[
                    Text('Name: ${character.name}'),
                    Text('HP: ${character.hp}'),
                    Text('Heal: ${character.heal}'),
                    Text('Damage: ${character.damage}'),
                  ] else if (character is MonsterInfo) ...[
                    Text('Monster Name: ${character.monsterName}'),
                    Text('HP: ${character.hp}'),
                    Text('Heal: ${character.heal}'),
                    Text('Damage: ${character.damage}'),
                  ],
                  SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
