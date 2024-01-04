import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

enum Warna { toYellow, toRed, toRandom }

enum Posisi { toTop, toBottom, toLeft, toRight, toRandomArea }

class ColorBloc {
  Alignment _alignment = Alignment(0.0, 0.0);
  Color _color = Colors.green;
  Random random = Random();

  // WARNA
  StreamController<Warna> eventController = StreamController<Warna>();
  StreamSink<Warna> get eventSink => eventController.sink;
  StreamController<Color> _streamController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _streamController.sink;
  Stream<Color> get stateStream => _streamController.stream;

  // JARAK
  StreamController<Posisi> posisiController = StreamController<Posisi>();
  StreamSink<Posisi> get eventSink2 => posisiController.sink;
  StreamController<Alignment> _stream_jarak = StreamController<Alignment>();
  StreamSink<Alignment> get _state_jarak => _stream_jarak.sink;
  Stream<Alignment> get stateJarak => _stream_jarak.stream;

  void _mapEvent(Warna warna) {
    if (warna == Warna.toYellow) {
      _color = Colors.yellow;
    } else if (warna == Warna.toRed) {
      _color = Colors.red;
    } else if (warna == Warna.toRandom) {
      _color = _getRandomColor();
    }
    _stateSink.add(_color);
  }

  void _Posisi(Posisi posisi) {
    if (posisi == Posisi.toBottom) {
      _alignment = Alignment(0, 0);
    } else if (posisi == Posisi.toTop) {
      _alignment = Alignment(0, -1);
    } else if (posisi == Posisi.toLeft) {
      _alignment = Alignment(-1, 0);
    } else if (posisi == Posisi.toRight) {
      _alignment = Alignment(1, 0);
    } else if (posisi == Posisi.toRandomArea) {
      _alignment = _getRandomAlign();
    }
    _state_jarak.add(_alignment);
  }

  Alignment _getRandomAlign() {
    return Alignment(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);
  }

  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  ColorBloc() : super() {
    eventController.stream.listen(_mapEvent);
    posisiController.stream.listen(_Posisi);
  }

  void dispose() {
    eventController.close();
    _streamController.close();
    posisiController.close();
    _stream_jarak.close();
  }
}

class BelajarBlocBuilder extends StatefulWidget {
  const BelajarBlocBuilder({Key? key}) : super(key: key);

  @override
  State<BelajarBlocBuilder> createState() => _BelajarBlocBuilderState();
}

class _BelajarBlocBuilderState extends State<BelajarBlocBuilder> {
  ColorBloc colorBloc = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(Warna.toRed);
              },
              child: Text('Merah'),
            ),
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(Warna.toYellow);
              },
              child: Text('Kuning'),
            ),
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(Warna.toRandom);
              },
              child: Text('Random'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)),
              height: MediaQuery.of(context).size.height / 1.5,
              margin: const EdgeInsets.only(bottom: 10),
              child: StreamBuilder(
                stream: colorBloc.stateStream,
                initialData: Colors.black,
                builder: (context, colorSnapshot) {
                  return StreamBuilder(
                    stream: colorBloc.stateJarak,
                    initialData: Alignment(0.0, 0.0),
                    builder: (context, alignSnapshot) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        alignment: alignSnapshot.data,
                        child: Container(
                          width: 200,
                          height: 200,
                          color: colorSnapshot.data,
                        
                      ));
                    },
                  );
                },
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        colorBloc.eventSink2.add(Posisi.toTop);
                      },
                      child: Text('keatas'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        colorBloc.eventSink2.add(Posisi.toBottom);
                      },
                      child: Text('kebawah'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        colorBloc.eventSink2.add(Posisi.toLeft);
                      },
                      child: Text('kekiri'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        colorBloc.eventSink2.add(Posisi.toRight);
                      },
                      child: Text('kekanan'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        colorBloc.eventSink2.add(Posisi.toRandomArea);
                      },
                      child: Text('random'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }
}
