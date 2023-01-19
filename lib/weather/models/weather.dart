import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}
enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Temperature extends Equatable {
  late double value;
  Temperature({required this.value});
  Temperature.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }
  @override
  List<Object?> get props => [value];
}

class Weather extends Equatable {
  final WeatherCondition? condition;
  final DateTime? lastUpdated;
  final String? location;
  final Temperature? temperature;

  const Weather({
    this.condition,
    this.lastUpdated,
    this.location,
    this.temperature,
  });

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      condition: weather.condition as WeatherCondition,
      lastUpdated: DateTime.now(),
      location: weather.location,
      temperature: Temperature(value: weather.temperature ?? 0),
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        condition: json['condition'],
        lastUpdated: json['lastUpdated'],
        location: json['location'],
        temperature: json['temperature']);
  }

  // Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
  }) {
    return Weather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }

  static final empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime(0),
    temperature: Temperature(value: 0),
    location: '--',
  );

  @override
  List<Object?> get props => [condition, lastUpdated, location, temperature];
}
