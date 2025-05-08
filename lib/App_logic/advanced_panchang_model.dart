// To parse this JSON data, do
//
//     final advancedPanchangModel = advancedPanchangModelFromJson(jsonString);

import 'dart:convert';

AdvancedPanchangModel advancedPanchangModelFromJson(String str) => AdvancedPanchangModel.fromJson(json.decode(str));

String advancedPanchangModelToJson(AdvancedPanchangModel data) => json.encode(data.toJson());

class AdvancedPanchangModel {
  String day;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  Tithi tithi;
  Nakshatra nakshatra;
  Yog yog;
  Karan karan;
  HinduMaah hinduMaah;
  String paksha;
  String ritu;
  String sunSign;
  String moonSign;
  String ayana;
  String panchangYog;
  int vikramSamvat;
  int shakaSamvat;
  String shakaSamvatName;
  String vkramSamvatName;
  //String dishaShool;
 // List<dynamic> dishaShoolRemedies;
  //String nakShool;
  String moonNivas;
  AbhijitMuhurta abhijitMuhurta;
  AbhijitMuhurta rahukaal;
  AbhijitMuhurta guliKaal;
  AbhijitMuhurta yamghantKaal;

  AdvancedPanchangModel({
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.tithi,
    required this.nakshatra,
    required this.yog,
    required this.karan,
    required this.hinduMaah,
    required this.paksha,
    required this.ritu,
    required this.sunSign,
    required this.moonSign,
    required this.ayana,
    required this.panchangYog,
    required this.vikramSamvat,
    required this.shakaSamvat,
    required this.shakaSamvatName,
    required this.vkramSamvatName,
   // required this.dishaShool,
   // required this.dishaShoolRemedies,
    //required this.nakShool,
    required this.moonNivas,
    required this.abhijitMuhurta,
    required this.rahukaal,
    required this.guliKaal,
    required this.yamghantKaal,
  });

  factory AdvancedPanchangModel.fromJson(Map<String, dynamic> json) => AdvancedPanchangModel(
    day: json["day"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    tithi: Tithi.fromJson(json["tithi"]),
    nakshatra: Nakshatra.fromJson(json["nakshatra"]),
    yog: Yog.fromJson(json["yog"]),
    karan: Karan.fromJson(json["karan"]),
    hinduMaah: HinduMaah.fromJson(json["hindu_maah"]),
    paksha: json["paksha"],
    ritu: json["ritu"],
    sunSign: json["sun_sign"],
    moonSign: json["moon_sign"],
    ayana: json["ayana"],
    panchangYog: json["panchang_yog"],
    vikramSamvat: json["vikram_samvat"],
    shakaSamvat: json["shaka_samvat"],
    shakaSamvatName: json["shaka_samvat_name"],
    vkramSamvatName: json["vkram_samvat_name"],
    // dishaShool: json["disha_shool"],
    // dishaShoolRemedies: List<dynamic>.from(json["disha_shool_remedies"].map((x) => x)),
    //nakShool: json["nak_shool"],
    moonNivas: json["moon_nivas"],
    abhijitMuhurta: AbhijitMuhurta.fromJson(json["abhijit_muhurta"]),
    rahukaal: AbhijitMuhurta.fromJson(json["rahukaal"]),
    guliKaal: AbhijitMuhurta.fromJson(json["guliKaal"]),
    yamghantKaal: AbhijitMuhurta.fromJson(json["yamghant_kaal"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "tithi": tithi.toJson(),
    "nakshatra": nakshatra.toJson(),
    "yog": yog.toJson(),
    "karan": karan.toJson(),
    "hindu_maah": hinduMaah.toJson(),
    "paksha": paksha,
    "ritu": ritu,
    "sun_sign": sunSign,
    "moon_sign": moonSign,
    "ayana": ayana,
    "panchang_yog": panchangYog,
    "vikram_samvat": vikramSamvat,
    "shaka_samvat": shakaSamvat,
    "shaka_samvat_name": shakaSamvatName,
    "vkram_samvat_name": vkramSamvatName,
   // "disha_shool": dishaShool,
    //"disha_shool_remedies": List<dynamic>.from(dishaShoolRemedies.map((x) => x)),
    //"nak_shool": nakShool,
    "moon_nivas": moonNivas,
    "abhijit_muhurta": abhijitMuhurta.toJson(),
    "rahukaal": rahukaal.toJson(),
    "guliKaal": guliKaal.toJson(),
    "yamghant_kaal": yamghantKaal.toJson(),
  };
}

class AbhijitMuhurta {
  String start;
  String end;

  AbhijitMuhurta({
    required this.start,
    required this.end,
  });

  factory AbhijitMuhurta.fromJson(Map<String, dynamic> json) => AbhijitMuhurta(
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
  };
}

class HinduMaah {
  bool adhikStatus;
  String purnimanta;
  String amanta;

  HinduMaah({
    required this.adhikStatus,
    required this.purnimanta,
    required this.amanta,
  });

  factory HinduMaah.fromJson(Map<String, dynamic> json) => HinduMaah(
    adhikStatus: json["adhik_status"],
    purnimanta: json["purnimanta"],
    amanta: json["amanta"],
  );

  Map<String, dynamic> toJson() => {
    "adhik_status": adhikStatus,
    "purnimanta": purnimanta,
    "amanta": amanta,
  };
}

class Karan {
  KaranDetails details;
  EndTime endTime;

  Karan({
    required this.details,
    required this.endTime,
  });

  factory Karan.fromJson(Map<String, dynamic> json) => Karan(
    details: KaranDetails.fromJson(json["details"]),
    endTime: EndTime.fromJson(json["end_time"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
    "end_time": endTime.toJson(),
  };
}

class KaranDetails {
  int karanNumber;
  String karanName;
  String special;
  String deity;

  KaranDetails({
    required this.karanNumber,
    required this.karanName,
    required this.special,
    required this.deity,
  });

  factory KaranDetails.fromJson(Map<String, dynamic> json) => KaranDetails(
    karanNumber: json["karan_number"],
    karanName: json["karan_name"],
    special: json["special"],
    deity: json["deity"],
  );

  Map<String, dynamic> toJson() => {
    "karan_number": karanNumber,
    "karan_name": karanName,
    "special": special,
    "deity": deity,
  };
}

class EndTime {
  int hour;
  int minute;
  int second;

  EndTime({
    required this.hour,
    required this.minute,
    required this.second,
  });

  factory EndTime.fromJson(Map<String, dynamic> json) => EndTime(
    hour: json["hour"],
    minute: json["minute"],
    second: json["second"],
  );

  Map<String, dynamic> toJson() => {
    "hour": hour,
    "minute": minute,
    "second": second,
  };
}

class Nakshatra {
  NakshatraDetails details;
  EndTime endTime;

  Nakshatra({
    required this.details,
    required this.endTime,
  });

  factory Nakshatra.fromJson(Map<String, dynamic> json) => Nakshatra(
    details: NakshatraDetails.fromJson(json["details"]),
    endTime: EndTime.fromJson(json["end_time"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
    "end_time": endTime.toJson(),
  };
}

class NakshatraDetails {
  int nakNumber;
  String nakName;
  String ruler;
  String deity;
  String special;
  String summary;

  NakshatraDetails({
    required this.nakNumber,
    required this.nakName,
    required this.ruler,
    required this.deity,
    required this.special,
    required this.summary,
  });

  factory NakshatraDetails.fromJson(Map<String, dynamic> json) => NakshatraDetails(
    nakNumber: json["nak_number"],
    nakName: json["nak_name"],
    ruler: json["ruler"],
    deity: json["deity"],
    special: json["special"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "nak_number": nakNumber,
    "nak_name": nakName,
    "ruler": ruler,
    "deity": deity,
    "special": special,
    "summary": summary,
  };
}

class Tithi {
  TithiDetails details;
  EndTime endTime;

  Tithi({
    required this.details,
    required this.endTime,
  });

  factory Tithi.fromJson(Map<String, dynamic> json) => Tithi(
    details: TithiDetails.fromJson(json["details"]),
    endTime: EndTime.fromJson(json["end_time"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
    "end_time": endTime.toJson(),
  };
}

class TithiDetails {
  int tithiNumber;
  String tithiName;
  String special;
  String summary;
  String deity;

  TithiDetails({
    required this.tithiNumber,
    required this.tithiName,
    required this.special,
    required this.summary,
    required this.deity,
  });

  factory TithiDetails.fromJson(Map<String, dynamic> json) => TithiDetails(
    tithiNumber: json["tithi_number"],
    tithiName: json["tithi_name"],
    special: json["special"],
    summary: json["summary"],
    deity: json["deity"],
  );

  Map<String, dynamic> toJson() => {
    "tithi_number": tithiNumber,
    "tithi_name": tithiName,
    "special": special,
    "summary": summary,
    "deity": deity,
  };
}

class Yog {
  YogDetails details;
  EndTime endTime;

  Yog({
    required this.details,
    required this.endTime,
  });

  factory Yog.fromJson(Map<String, dynamic> json) => Yog(
    details: YogDetails.fromJson(json["details"]),
    endTime: EndTime.fromJson(json["end_time"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
    "end_time": endTime.toJson(),
  };
}

class YogDetails {
  int yogNumber;
  String yogName;
  String special;
  String meaning;

  YogDetails({
    required this.yogNumber,
    required this.yogName,
    required this.special,
    required this.meaning,
  });

  factory YogDetails.fromJson(Map<String, dynamic> json) => YogDetails(
    yogNumber: json["yog_number"],
    yogName: json["yog_name"],
    special: json["special"],
    meaning: json["meaning"],
  );

  Map<String, dynamic> toJson() => {
    "yog_number": yogNumber,
    "yog_name": yogName,
    "special": special,
    "meaning": meaning,
  };
}
