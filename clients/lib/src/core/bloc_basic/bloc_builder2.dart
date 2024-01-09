import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class Data {
  Future<void> loadData();
  Map<String, dynamic> toJson();
}

class Weather {
  double? temperature;
  String? region;
  DateTime? time;
  String? city;

  Weather({
    this.temperature,
    this.region,
    this.time,
    this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      region: json["region"],
      temperature: json["temperature"],
      time: DateTime.parse(json["time"]),
    );
  }
}

class DataWeather extends Cubit<Weather> implements Data {
  String? keyApi;
  DataWeather() : super(Weather());

  @override
  Future<void> loadData() async {
    keyApi = dotenv.env['API_KEY']!.toLowerCase();
    String endpoint =
        'https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid=$keyApi';

    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        var data = Weather.fromJson(json.decode(response.body));
        emit(data); 
      } else {
        print('Failed to load weather data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "region": state.region,
      "temperature": state.temperature,
      "time": state.time?.toIso8601String(),
    };
  }
}

class OpenWeatherApp extends StatefulWidget {
  const OpenWeatherApp({Key? key}) : super(key: key);

  @override
  State<OpenWeatherApp> createState() => _OpenWeatherAppState();
}

class _OpenWeatherAppState extends State<OpenWeatherApp> {
  @override
  void initState() {
    super.initState();
    context.read<DataWeather>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataWeather(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DataWeather, Weather>(
            builder: (context, weather) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temperature: ${weather.temperature}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Region: ${weather.region}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Time: ${weather.time?.toLocal()}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
