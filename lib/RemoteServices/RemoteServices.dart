import 'dart:convert';

import 'package:auspi_agni_flutter/App_logic/GetCityState.dart';
import 'package:auspi_agni_flutter/App_logic/GetMoonPhase.dart';
import 'package:auspi_agni_flutter/App_logic/Sun_model.dart';
import 'package:http/http.dart' as http;
class RemoteServices{
  static var client = http.Client();
  //static final String BASE_URL = "http://192.168.1.45/xsent/api/";
  static final String BASE_URL = "https://xsent.ae/api/";

  static var header = {'Content-Type': 'application/json'};

  static Future<List<GetMoonPhase>> fetchTSLis( String url) async {
    var response = await client.get(Uri.parse(
        url),headers: header);
    print("statusCode ====== ${response.statusCode}");
    print(response.statusCode);
   // print("map ${jsonEncode(map)}");
    print(url);


    var jsonString = response.body;
    print(jsonString);
    return getMoonPhaseFromJson(jsonString);
  }
  static Future<GetCityState> fetchCityState( String url) async {
    var response = await client.get(Uri.parse(
        url),headers: header);
    print("statusCode ====== ${response.statusCode}");
    print(response.statusCode);
    // print("map ${jsonEncode(map)}");
    print(url);


    var jsonString = response.body;
    print(jsonString);
    return getCityStateFromJson(jsonString);
  }
  static Future<List<GetSunRise>> fetchSunriseData( String url) async {
    var response = await client.get(Uri.parse(
        url),headers: header);
    print("statusCode ====== ${response.statusCode}");
    print(response.statusCode);
    // print("map ${jsonEncode(map)}");
    print(url);


    var jsonString = response.body;
    print(jsonString);
    return getSunRiseFromJson(jsonString);
  }
  static Future<String> fetchPostData(url,lat,long,tz) async { // advanced panchang APIs

    var userId = '623806';
    var apiKey = '0dd30c2bb8d8dd7275b3dd0189e38eff';
    Map map = {
      "day": DateTime.now().day,
      "month": DateTime.now().month,
      "year": DateTime.now().year,
      "hour": DateTime.now().hour,
      "min": DateTime.now().minute,
      // "day": 21,
      // "month": 6,
      // "year": 2023,
      // "hour": 6,
      // "min": 0,
      "lat": lat,
      "lon": long,
      "tzone": double.parse(tz),
    };

    String buffer = "${userId + ":" + apiKey}";
    String bs64 = base64.encode(buffer.codeUnits);
    print("bs64 $bs64");
    var auth = "Basic " +  bs64;

    var header2 = {'Content-Type': 'application/json','authorization': auth};

    try {
      var response = await client.post(Uri.parse(
          '$url'),headers: header2,body: JsonEncoder().convert(map));
      print(response.statusCode);
      print('$url');
      print('response.body ::::  ${response.body}');
      return response.body;
    } finally {}
  }
}