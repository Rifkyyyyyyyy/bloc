import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateBloc {
  int num;
  bool? increment;
  StateBloc({required this.num, this.increment});
}

class Tambahkan extends Cubit<StateBloc> {
  Tambahkan() : super(StateBloc(num: 0));

  void increment() => emit(StateBloc(num: state.num + 1, increment: true));

  void decrement() {
    if (state.num > 0) {
      emit(StateBloc(num: state.num - 1, increment: false));
    }
  }
}

class BlocBuilderBelajar extends StatefulWidget {
  const BlocBuilderBelajar({Key? key}) : super(key: key);

  @override
  State<BlocBuilderBelajar> createState() => _BlocBuilderState();
}

class _BlocBuilderState extends State<BlocBuilderBelajar> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<Tambahkan, StateBloc>(
        listener: (context, state) {
          if (state.increment != null && state.increment == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('increment'),
              duration: Duration(milliseconds: 300),
            ));
          } else if (state.increment != null && state.increment == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('decrement'),
              duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<Tambahkan, StateBloc>(
                builder: (context, state) {
                  return Text(
                    'Nilai saat ini : ${BlocProvider.of<Tambahkan>(ctx).state.num.toString()}',
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<Tambahkan>(ctx).decrement();
                    },
                    child: Text('kurangi'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<Tambahkan>(ctx).increment();
                    },
                    child: Text('tambahkan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
