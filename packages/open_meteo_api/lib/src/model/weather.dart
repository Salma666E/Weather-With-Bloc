class Weather {
  Weather({
    required this.temperature,
    required this.weatherCode,
  });

  double? temperature;
  double? weatherCode;
  Weather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    weatherCode = json['weatherCode'];
  }
}
