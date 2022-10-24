/*
 * initial before anything loads
 * loading during the API call
 * success if the API call is successful
 * failure if the API call is unsuccessful
 */
part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  late final WeatherStatus status;
  late final Weather weather;
  late final TemperatureUnits temperatureUnits;

  WeatherState({
    this.status = WeatherStatus.initial,
    this.temperatureUnits = TemperatureUnits.celsius,
    Weather? weather,
  }) : weather = weather ?? Weather.empty;

  @override
  List<Object?> get props => [];
}
