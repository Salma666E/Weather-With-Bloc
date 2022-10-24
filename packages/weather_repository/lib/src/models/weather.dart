import 'package:equatable/equatable.dart';

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}

class Weather extends Equatable {
  String? location;
  double? temperature;
  WeatherCondition? condition;

  Weather({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    temperature = json['temperature'];
    condition = json['condition'];
  }

  @override
  List<Object?> get props => [location, temperature, condition];
}
