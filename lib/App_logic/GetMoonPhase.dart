// To parse this JSON data, do
//
//     final getMoonPhase = getMoonPhaseFromJson(jsonString);

import 'dart:convert';

List<GetMoonPhase> getMoonPhaseFromJson(String str) => List<GetMoonPhase>.from(json.decode(str).map((x) => GetMoonPhase.fromJson(x)));

String getMoonPhaseToJson(List<GetMoonPhase> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMoonPhase {
  GetMoonPhase({
   required this.error,
    required this.errorMsg,
    required this.targetDate,
    required this.moon,
    required this.index,
    required this.age,
    required this.phase,
    required this.distance,
    required this.illumination,
    required this.angularDiameter,
    required this.distanceToSun,
    required this.sunAngularDiameter,
  });

  int error;
  String errorMsg;
  String targetDate;
  List<String> moon;
  int index;
  double age;
  String phase;
  double distance;
  double illumination;
  double angularDiameter;
  double distanceToSun;
  double sunAngularDiameter;

  factory GetMoonPhase.fromJson(Map<String, dynamic> json) => GetMoonPhase(
    error: json["Error"],
    errorMsg: json["ErrorMsg"],
    targetDate: json["TargetDate"],
    moon: List<String>.from(json["Moon"].map((x) => x)),
    index: json["Index"],
    age: json["Age"].toDouble(),
    phase: json["Phase"],
    distance: json["Distance"].toDouble(),
    illumination: json["Illumination"].toDouble(),
    angularDiameter: json["AngularDiameter"].toDouble(),
    distanceToSun: json["DistanceToSun"].toDouble(),
    sunAngularDiameter: json["SunAngularDiameter"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Error": error,
    "ErrorMsg": errorMsg,
    "TargetDate": targetDate,
    "Moon": List<dynamic>.from(moon.map((x) => x)),
    "Index": index,
    "Age": age,
    "Phase": phase,
    "Distance": distance,
    "Illumination": illumination,
    "AngularDiameter": angularDiameter,
    "DistanceToSun": distanceToSun,
    "SunAngularDiameter": sunAngularDiameter,
  };
}
