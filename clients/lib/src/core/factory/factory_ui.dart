import 'package:clients/src/core/factory/factory_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCounterUi extends StatelessWidget {
  const MyCounterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StateBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyCounterApp(),
      ),
    );
  }
}

class MyCounterApp extends StatefulWidget {
  const MyCounterApp({super.key});

  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

class _MyCounterAppState extends State<MyCounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<StateBloc, CounterState>(builder: (ctx, state) {
            return Text(state.when(
              factoryInitial: () => '-',
              running: (number) => '$number',
            
            ) , style: TextStyle(fontSize: 40),);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<StateBloc>()
                        .add(const CounterEvent.increment());
                  },
                  child: Text('Tambahkan')),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<StateBloc>()
                        .add(const CounterEvent.decrement());
                  },
                  child: Text('Kurangkan')),
            ],
          )
        ],
      ),
    );
  }
}
