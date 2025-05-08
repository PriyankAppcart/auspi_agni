// To parse this JSON data, do
//
//     final getCityState = getCityStateFromJson(jsonString);

import 'dart:convert';

GetCityState getCityStateFromJson(String str) => GetCityState.fromJson(json.decode(str));

String getCityStateToJson(GetCityState data) => json.encode(data.toJson());

class GetCityState {
  GetCityState({
    required this.latitude,
    required this.longitude,
    required this.continent,
    required this.lookupSource,
    required this.continentCode,
    required this.localityLanguageRequested,
    required this.city,
    required this.countryName,
    required this.countryCode,
    required this.postcode,
    required this.principalSubdivision,
    required this.principalSubdivisionCode,
    required this.plusCode,
    required this.locality,
  });

  double latitude;
  double longitude;
  String continent;
  String lookupSource;
  String continentCode;
  String localityLanguageRequested;
  String city;
  String countryName;
  String countryCode;
  String postcode;
  String principalSubdivision;
  String principalSubdivisionCode;
  String plusCode;
  String locality;

  factory GetCityState.fromJson(Map<String, dynamic> json) => GetCityState(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    continent: json["continent"],
    lookupSource: json["lookupSource"],
    continentCode: json["continentCode"],
    localityLanguageRequested: json["localityLanguageRequested"],
    city: json["city"],
    countryName: json["countryName"],
    countryCode: json["countryCode"],
    postcode: json["postcode"],
    principalSubdivision: json["principalSubdivision"],
    principalSubdivisionCode: json["principalSubdivisionCode"],
    plusCode: json["plusCode"],
    locality: json["locality"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "continent": continent,
    "lookupSource": lookupSource,
    "continentCode": continentCode,
    "localityLanguageRequested": localityLanguageRequested,
    "city": city,
    "countryName": countryName,
    "countryCode": countryCode,
    "postcode": postcode,
    "principalSubdivision": principalSubdivision,
    "principalSubdivisionCode": principalSubdivisionCode,
    "plusCode": plusCode,
    "locality": locality,
  };
}
