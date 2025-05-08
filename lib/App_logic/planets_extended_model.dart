// To parse this JSON data, do
//
//     final planetsExtendedModel = planetsExtendedModelFromJson(jsonString);

import 'dart:convert';

List<PlanetsExtendedModel> planetsExtendedModelFromJson(String str) => List<PlanetsExtendedModel>.from(json.decode(str).map((x) => PlanetsExtendedModel.fromJson(x)));

String planetsExtendedModelToJson(List<PlanetsExtendedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlanetsExtendedModel {
  int id;
  String name;
  double fullDegree;
  double normDegree;
  double speed;
  dynamic isRetro;
  String sign;
  String signLord;
  String nakshatra;
  String nakshatraLord;
  int house;

  PlanetsExtendedModel({
    required this.id,
    required this.name,
    required this.fullDegree,
    required this.normDegree,
    required this.speed,
    required this.isRetro,
    required this.sign,
    required this.signLord,
    required this.nakshatra,
    required this.nakshatraLord,
    required this.house,
  });

  factory PlanetsExtendedModel.fromJson(Map<String, dynamic> json) => PlanetsExtendedModel(
    id: json["id"],
    name: json["name"],
    fullDegree: json["fullDegree"]?.toDouble(),
    normDegree: json["normDegree"]?.toDouble(),
    speed: json["speed"]?.toDouble(),
    isRetro: json["isRetro"],
    sign: json["sign"],
    signLord: json["signLord"],
    nakshatra: json["nakshatra"],
    nakshatraLord: json["nakshatraLord"],
    house: json["house"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "fullDegree": fullDegree,
    "normDegree": normDegree,
    "speed": speed,
    "isRetro": isRetro,
    "sign": sign,
    "signLord": signLord,
    "nakshatra": nakshatra,
    "nakshatraLord": nakshatraLord,
    "house": house,
  };
}
