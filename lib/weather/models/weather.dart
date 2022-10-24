import 'package:equatable/equatable.dart';

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
  static final empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime(0),
    temperature: Temperature(value: 0),
    location: '--',
  );

  const Weather({
    this.condition,
    this.lastUpdated,
    this.location,
    this.temperature,
  });
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

  @override
  List<Object?> get props => [condition, lastUpdated, location, temperature];
}
