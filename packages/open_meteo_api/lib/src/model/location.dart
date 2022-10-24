
class Location {
  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  int? id;
  String? name;
  double? latitude;
  double? longitude;
  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
