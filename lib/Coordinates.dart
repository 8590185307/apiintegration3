import 'dart:convert';

Coordinates coordinatesFromJson(String str) => Coordinates.fromJson(json.decode(str));
String coordinatesToJson(Coordinates data) => json.encode(data.toJson());
class Coordinates {
  Coordinates({
      this.lat, 
      this.lng,});

  Coordinates.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}