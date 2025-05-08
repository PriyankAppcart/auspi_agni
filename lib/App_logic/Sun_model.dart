// To parse this JSON data, do
//
//     final getSunRise = getSunRiseFromJson(jsonString);

import 'dart:convert';

List<GetSunRise> getSunRiseFromJson(String str) => List<GetSunRise>.from(json.decode(str).map((x) => GetSunRise.fromJson(x)));

String getSunRiseToJson(List<GetSunRise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSunRise {
  GetSunRise({
    required this.error,
    required this.errorMessage,
    required this.targetDate,
    required this.formattedDate,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
    required  this.daylength,
    required this.zenith,
    required this.dawn,
    required this.dusk,
    required this.astrodusk,
    this.daylightRemaining,
  });

  int error;
  String errorMessage;
  int targetDate;
  String formattedDate;
  String timezone;
  String sunrise;
  String sunset;
  String daylength;
  String zenith;
  String dawn;
  String dusk;
  int astrodusk;
  String ?daylightRemaining;

  factory GetSunRise.fromJson(Map<String, dynamic> json) => GetSunRise(
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
    targetDate: json["TargetDate"],
    formattedDate: json["FormattedDate"],
    timezone: json["Timezone"],
    sunrise: json["Sunrise"],
    sunset: json["Sunset"],
    daylength: json["Daylength"],
    zenith: json["Zenith"],
    dawn: json["Dawn"],
    dusk: json["Dusk"],
    astrodusk: json["Astrodusk"],
    daylightRemaining: json["Daylight_remaining"],
  );

  Map<String, dynamic> toJson() => {
    "Error": error,
    "ErrorMessage": errorMessage,
    "TargetDate": targetDate,
    "FormattedDate": formattedDate,
    "Timezone": timezone,
    "Sunrise": sunrise,
    "Sunset": sunset,
    "Daylength": daylength,
    "Zenith": zenith,
    "Dawn": dawn,
    "Dusk": dusk,
    "Astrodusk": astrodusk,
    "Daylight_remaining": daylightRemaining,
  };
}
