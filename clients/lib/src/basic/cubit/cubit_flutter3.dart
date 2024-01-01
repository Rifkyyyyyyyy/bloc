import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCubit extends Cubit<String> {
  String? name;
  int? password;

  ManageCubit({this.name, this.password}) : super('');

  Future<void> login() async {
    if (name != null &&
        password != null &&
        name!.isNotEmpty &&
        password.toString().isNotEmpty) {
      emit('hello $name');
    } else {
      emit('error !password tidak boleh kosong');
    }
  }

  void logout() {
    emit('$state telah logout');
  }
}

class BelajarCubit3 extends StatefulWidget {
  const BelajarCubit3({Key? key}) : super(key: key);

  @override
  State<BelajarCubit3> createState() => _BelajarCubit3State();
}

class _BelajarCubit3State extends State<BelajarCubit3> {
  late TextEditingController textEditingController;
  late TextEditingController passwordController;
  late ManageCubit manageCubit;

  void login() {
    textEditingController = TextEditingController();
    passwordController = TextEditingController();
    manageCubit = ManageCubit(
      name: textEditingController.text,
      password: int.tryParse(passwordController.text) ?? 0,
    );
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  void clear() {
    setState(() {
      textEditingController.clear();
      passwordController.clear();
    });
  }

  @override
  void dispose() {
    login();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Bloc')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    manageCubit.name = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                onChanged: (value) {
                  setState(() {
                    manageCubit.password = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (textEditingController.value.text.length > 8 &&
                      passwordController.value.text.length > 8) {
                    manageCubit.login();
                    String message = manageCubit.state;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                      duration: Duration(seconds: 2),
                    ));
                    clear();
                  } else {
                    print('mantap');
                  }
                },
                child: Text('login')),
          ],
        ),
      ),
    );
  }
}
