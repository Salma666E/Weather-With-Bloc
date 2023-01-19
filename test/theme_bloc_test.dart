import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_bloc/theme/cubit/theme_cubit.dart';
import 'package:weather_bloc/weather/models/models.dart';


class MockWeather extends Mock implements Weather {
  MockWeather(this._condition);

  final WeatherCondition _condition;

  @override
  WeatherCondition get condition => _condition;

  @override
  Weather copyWith({WeatherCondition? condition, DateTime? lastUpdated, String? location, Temperature? temperature}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement lastUpdated
  DateTime? get lastUpdated => throw UnimplementedError();

  @override
  // TODO: implement location
  String? get location => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();

  @override
  // TODO: implement temperature
  Temperature? get temperature => throw UnimplementedError();
}

void main() {
  // initHydratedStorage();

  group('ThemeCubit', () {
    test('initial state is correct', () {
      expect(ThemeCubit().state, ThemeCubit.defaultColor);
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        final themeCubit = ThemeCubit();
        expect(
          themeCubit.fromJson(themeCubit.toJson(themeCubit.state)),
          themeCubit.state,
        );
      });
    });

    group('updateTheme', () {
      final clearWeather = MockWeather(WeatherCondition.clear);
      final snowyWeather = MockWeather(WeatherCondition.snowy);
      final cloudyWeather = MockWeather(WeatherCondition.cloudy);
      final rainyWeather = MockWeather(WeatherCondition.rainy);
      final unknownWeather = MockWeather(WeatherCondition.unknown);

      blocTest<ThemeCubit, Color>(
        'emits correct color for WeatherCondition.clear',
        build: ThemeCubit.new,
        act: (cubit) => cubit.updateTheme(clearWeather),
        expect: () => <Color>[Colors.orangeAccent],
      );

      blocTest<ThemeCubit, Color>(
        'emits correct color for WeatherCondition.snowy',
        build: ThemeCubit.new,
        act: (cubit) => cubit.updateTheme(snowyWeather),
        expect: () => <Color>[Colors.lightBlueAccent],
      );

      blocTest<ThemeCubit, Color>(
        'emits correct color for WeatherCondition.cloudy',
        build: ThemeCubit.new,
        act: (cubit) => cubit.updateTheme(cloudyWeather),
        expect: () => <Color>[Colors.blueGrey],
      );

      blocTest<ThemeCubit, Color>(
        'emits correct color for WeatherCondition.rainy',
        build: ThemeCubit.new,
        act: (cubit) => cubit.updateTheme(rainyWeather),
        expect: () => <Color>[Colors.indigoAccent],
      );

      blocTest<ThemeCubit, Color>(
        'emits correct color for WeatherCondition.unknown',
        build: ThemeCubit.new,
        act: (cubit) => cubit.updateTheme(unknownWeather),
        expect: () => <Color>[ThemeCubit.defaultColor],
      );
    });
  });
}
