import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract mixin class GreetingName {
  String hello();
  String goodbye();
}

class Greeting extends Cubit<String> with GreetingName {
  String name;
  Greeting({required this.name}) : super('');
  @override
  String hello() {
    emit(state + name);
    return 'hello $state, how are you today?';
  }

  @override
  String goodbye() {
    emit(state);
    return 'nice to hear that $state, well goodbye';
  }
}

class BelajarCubit extends StatefulWidget {
  const BelajarCubit({super.key});

  @override
  State<BelajarCubit> createState() => _BelajarCubitState();
}

class _BelajarCubitState extends State<BelajarCubit> {
  var data = <Greeting>[];
  List<String> namaOrang = ['rifky', 'ririn', 'meong'];

  void menyapa() {
    for (var i = 0; i < namaOrang.length; i++) {
      if (data.every((person) => person.name != namaOrang[i])) {
        var person = Greeting(name: namaOrang[i]);
        data.add(person);
      }
    }
  }

  Stream<String> hello() async* {
    var a = await Future.delayed(const Duration(seconds: 1), () {
      menyapa();
    });

    yield a.toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    data = [];
    menyapa();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                  stream: hello(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text('.......'),
                      );
                    } else {
                      return Container(
                          height: 300,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: data.map((person) {
                                return Container(
                                  height: 60,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ListTile(
                                    title: Text(person.hello()),
                                    subtitle: Text(person.goodbye()),
                                  ),
                                );
                              }).toList(),
                            ),
                          ));
                    }
                  }),
            ],
          )),
    );
  }
}
