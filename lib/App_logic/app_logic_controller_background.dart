import 'dart:async';

import 'package:auspi_agni_flutter/Moon_yog_calc.dart';
import 'package:auspi_agni_flutter/Notifications/LocalNotificationService.dart';
import 'package:auspi_agni_flutter/RemoteServices/RemoteServices.dart';
import 'package:auspi_agni_flutter/auspi_moon_calc.dart';
import 'package:auspi_agni_flutter/ghatika_calc.dart';

import 'package:auspi_agni_flutter/moon_rashi_calc.dart';
import 'package:auspi_agni_flutter/sun_calc_data.dart';
import 'package:auspi_agni_flutter/timezone_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
class app_logic_controller_background extends GetxController{

  /*
  * GPS DATA
  * */
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  //var tz= new timezone();

  /* GPS DATA*/
  //get CRashi => null;
  auspi_moon_calc MoonCalc = new auspi_moon_calc();
  sun_calc_data SunCalc = new sun_calc_data();
  moon_rashi_calc MoonRashiCalc = new moon_rashi_calc();
  moon_yog_calc MoonYogCalc = new moon_yog_calc();
  ghatika_calc GhatikaCalc = new ghatika_calc();
  timezone_selelct MyTZ= new timezone_selelct();
  var TimeZone="";
  // var  moon_calc;
  // //Calendar calendar= Calendar.getInstance();
  //
  // //double DateSec =calendar.getTime().getTime()/1000;
  // //moon_calc=MoonCalc.phase(double.parse(DateSec));
  // // print(DateSec);
  // // print(moon_calc[1]);
   var cday=0.000;
  // //cday=moon_calc[1]+7;
  // //print(cday);
   var CNkh="";
  // var day=DateTime.now().weekday;
  // var hour=DateTime.now().hour;
  // // print(day);
  // var rgood;
  // var rbad;
  // var app;
  // var ngood;
  // var nbad;
  var SunData;
  var SunRashi="";
  var SunNksh="";
  var SunRutu="";
  var SunAyan="";
  var bharatiya_saur="";
  var Solar_deg=0;
   var CRashi="";
   var days="blank";
   var graha="";
  // var snd=true;
   var Rahukal="";

  var Yog_str="";
  var Fal_str="";
  // var yogbad;
   var yoggood="";
  // var j=DateTime.now().minute;
  // List rashi = ["Mesh","Mesh","Vrushabh","Mithun","Karka",
  //   "Sinha","Kanya","Tula","Vrushchik","Dhanu","Makar","Kumbha","Meen"];
  //
  // int mth = DateTime.now().month;
  // int cmpTo = 0;
  // int cmpdate = DateTime.now().day;
  var current_Time="";
  var Moonphase;
  var SunriseData;
  var SunRise="";
  var SunSet="";
  var NextSunriseData;
  var NextSunRise="";
  var NextSunSet="";
  var PrevSunriseData;
  var PrevSunRise="";
  var PrevSunSet="";
  var MoonAge="";
  var MoonIllumination="";

  var Moondata;
  var YogData;

  var CurrentDayImage="sunday.png";

  var hour_rotation=0.0;
  var minutes_rotation=0;
  var seconds_rotation=0;
  var Hora_start="";
  var Hora_end="";
  var Hora_duration="";
  var equalTime=0.00;
  var equalTimeNight=0.00;
  var dayNight="day";
  List<String> GhatikaData=[];
  List Days_Week = ["Monday","Monday","Tuesday","Wednesday","Thursday",
    "Friday","Saturday","Sunday"];

  var  today=(DateTime.now().microsecondsSinceEpoch/1000000).round();
  var nextDay=(DateTime.now().add(Duration(days: 1)).microsecondsSinceEpoch/1000000).round();
  var prevDay=(DateTime.now().subtract(Duration(days: 1)).microsecondsSinceEpoch/1000000).round();
  //var CurrentTime=(DateTime(DateTime.now().year,DateTime.now().month,prevDay1.day,7,52,0).microsecondsSinceEpoch/1000000).round();
  //var CurrentDate=DateTime(DateTime.now().year,DateTime.now().month,prevDay1.day,7,52,0);
  // var  today=(DateTime(DateTime.now().year,DateTime.now().month,4,7,52,0).microsecondsSinceEpoch/1000000).round();
  // var nextDay=(DateTime(DateTime.now().year,DateTime.now().month,5,7,52,0).microsecondsSinceEpoch/1000000).round();
  // var prevDay=(DateTime(DateTime.now().year,DateTime.now().month,3,7,52,0).microsecondsSinceEpoch/1000000).round();
  Timer ?timer;
  Timer ?timer_ghatika;
  var miliSec=0;
  var mypal =0.00;
  var myghatika =0.00;
  var prahar="";
  var myvipal =0.00;
  var rahukaalstartTime="";
  var rahukaalendTime="";
  Map ?Hora_map;
  List Hora_Sunday_list =["Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva",
    "Venus-Journey","Mercury-Learning","Sun-Rajseva","Venus-Journey" ,"Mercury-Learning",
    "Moon-good for everything","Saturn-Saving","Jupiter-Marriage","Mars-Debate/War",
    "Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything",
    "Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey",
    "Mercury-Learning","Moon-good for everything","Saturn-Saving"];

  List hora_Monday_list =["Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything",
    "Saturn-Saving","Jupiter-Marriage","Moon-good for everything","Saturn-Saving","Jupiter-Marriage"
    ,"Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything",
    "Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey",
    "Mercury-Learning","Moon-good for everything","Saturn-Saving","Jupiter-Marriage","Mars-Debate/War",
    "Sun-Rajseva"];

  List hora_Tuesday_list =["Moon-good for everything","Saturn-Saving","Jupiter-Marriage",
    "Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mars-Debate/War","Sun-Rajseva"
    ,"Venus-Journey","Mercury-Learning","Moon-good for everything","Saturn-Saving",
    "Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey"
    ,"Mercury-Learning","Moon-good for everything","Saturn-Saving","Jupiter-Marriage",
    "Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything"];

  List hora_Wednesday_list =["Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning"
    ,"Moon-good for everything","Saturn-Saving","Mercury-Learning","Moon-good for everything",
    "Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey",
    "Mercury-Learning","Moon-good for everything","Saturn-Saving"
    ,"Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning",
    "Moon-good for everything","Saturn-Saving","Jupiter-Marriage","Mars-Debate/War"];

  List hora_Thursday_list =["Mercury-Learning","Moon-good for everything","Saturn-Saving","Jupiter-Marriage"
    ,"Mars-Debate/War","Sun-Rajseva","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva"
    ,"Venus-Journey","Mercury-Learning","Moon-good for everything","Saturn-Saving","Jupiter-Marriage"
    ,"Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything"
    ,"Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning"];

  List hora_Friday_list =["Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey"
    ,"Mercury-Learning","Moon-good for everything","Venus-Journey","Mercury-Learning","Moon-good for everything"
    ,"Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey"
    ,"Mercury-Learning","Moon-good for everything","Saturn-Saving","Jupiter-Marriage","Mars-Debate/War"
    ,"Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything","Saturn-Saving","Jupiter-Marriage"];

  List hora_Saturday_list =["Venus-Journey","Mercury-Learning","Moon-good for everything","Saturn-Saving"
    ,"Jupiter-Marriage","Mars-Debate/War","Saturn-Saving","Jupiter-Marriage","Mars-Debate/War"
    ,"Sun-Rajseva","Venus-Journey","Mercury-Learning","Moon-good for everything","Saturn-Saving"
    ,"Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey","Mercury-Learning"
    ,"Moon-good for everything","Saturn-Saving","Jupiter-Marriage","Mars-Debate/War","Sun-Rajseva","Venus-Journey"];

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  Future<void> onInit() async {

    super.onInit();
    await LocalNotificationService.configureLocalTimeZone();

    checkGps();
//scheduleDailyTenAMNotification();
    Hora_map={0:Hora_Sunday_list,1:hora_Monday_list,2:hora_Tuesday_list,3:hora_Wednesday_list,
      4:hora_Thursday_list,5:hora_Friday_list,6:hora_Saturday_list,7:Hora_Sunday_list};
    print("nextDay$nextDay");
    days=Days_Week[DateTime.now().weekday];
    print("weekday$days");
   // GhatikaCalc.getGhatikaPaldata();
   // print(DateTime.now().timeZoneName);
   // print(DateTime.now().timeZoneOffset);
    var tzsplit= DateTime.now().timeZoneOffset.toString().split(":");

    var tzhours=Time_Format(tzsplit[0]);
    var tzmins=Time_Format(tzsplit[1]);

   // print(tzhours);
   // print(tzmins);
    var myvipal_cnt =0.00;
    var mypal_cnt =0.00;
    var myghatika_cnt =0.00;


    TimeZone=MyTZ.getTimezone("$tzhours:$tzmins");
    //print(TimeZone);
    if(SunRise!="") {
      // GhatikaData = GhatikaCalc.getGhatikaPaldata("06:00:00","18:00:00","06:00:00","18:00:00","06:00:00","18:00:00");
      GhatikaData = GhatikaCalc.getGhatikaPaldata(SunRise, SunSet, NextSunRise, NextSunSet,PrevSunRise,PrevSunSet);
    }
    else{
      GhatikaData = GhatikaCalc.getGhatikaPaldata("06:00:00","18:00:00","06:00:00","18:00:00","06:00:00","18:00:00");
    }
    miliSec=miliSec+DateTime.now().millisecond;
    // mypal=double.parse("57.00");
    // myghatika=double.parse(GhatikaData[1]);
    mypal=double.parse(GhatikaData[2]);
    myghatika=double.parse(GhatikaData[1]);
    myvipal=double.parse(GhatikaData[3]);
    // print("myPal-0--$mypal");
    // myvipal_cnt=double.parse((miliSec/530).toString());
    // print("myvipal1-$myvipal_cnt");
    // if(myvipal_cnt>=60)
    // {
    //
    //   mypal_cnt=double.parse((myvipal_cnt/60).toString());
    // }
    // if(mypal_cnt>=60)
    // {
    //   // mypal=0.00;
    //   myghatika_cnt=double.parse((mypal_cnt/60).toString());;
    // }
    //
    // myvipal= (myvipal_cnt- double.parse((mypal_cnt.floor()*60).toString())).floor();
    // mypal=mypal+mypal_cnt;
    // print("myPal---$mypal");
    // if(mypal>=60.0 && myghatika_cnt==0 )
    //   {
    //     mypal=mypal-60;
    //     myghatika=myghatika+1;
    //   }
    // else if(mypal>=60.0 && myghatika_cnt>0 )
    //   {
    //     mypal=mypal-((myghatika_cnt+1)*60);
    //     myghatika=myghatika+1;
    //   }
    //
    // print("myPal-2--$mypal");
    // myghatika=myghatika+myghatika_cnt;
    // // print("miliSec$miliSec");
    // print("myvipal_cnt$myvipal_cnt");
    // print("mypal_cnt$mypal_cnt");
    // print("myghatika_cnt$myghatika_cnt");
    //
    // print("myvipal$myvipal");
    //  print("mypal$mypal");
    // print("myghatika$myghatika");
    var g_rot= myghatika*6;
    prahar=GhatikaData[0];
    if(g_rot<0)
    {
      g_rot=g_rot+360;
    }
    if(g_rot<=45)
    {
      prahar="1";
    }
    else if(g_rot>45&&g_rot<=90)
    {
      prahar="2";
    }
    else if(g_rot>90&&g_rot<=135)
    {
      prahar="3";
    }
    else if(g_rot>135&&g_rot<=180)
    {
      prahar="4";
    }
    else if(g_rot>180&&g_rot<=225)
    {
      prahar="5";
    }
    else if(g_rot>225&&g_rot<=270)
    {
      prahar="6";
    }
    else if(g_rot>270&&g_rot<=315)
    {
      prahar="7";
    }
    else if(g_rot>315&&g_rot<=360)
    {
      prahar="8";
    }

    MoonIllumination="Pr:${prahar} Gha:${myghatika.floor().toStringAsFixed(0)} Pal${mypal.floor().toStringAsFixed(0)}"
        " Vipal${myvipal.floor()}";

    //});
    // timer = Timer. periodic(Duration(seconds: 1), (Timer t) {
     test();
    // GhatikaCalc.firstrun();


     today=(DateTime.now().microsecondsSinceEpoch/1000000).round();
     //getMoonPhaseSummeryList();
     hour_rotation=((30*(DateTime.now().hour))+((6*(DateTime.now().minute)*30)/360)) ;
     minutes_rotation=6*(DateTime.now().minute);
     seconds_rotation=6*(DateTime.now().second);
     //print("seconds_rotation$seconds_rotation");

      // SetMoonData();
     SunData=SunCalc.getSundata(0.00);
     bharatiya_saur=SunData[4];
     SunRashi=SunData[0];
     SunNksh=SunData[1];
     SunRutu=SunData[2];
     SunAyan=SunData[3];
     Solar_deg=double.parse(SunData[5]).toInt();
     //Solar_deg=253;

      //  print(DateTime.now().timeZoneName);
      //  print(DateTime.now().timeZoneOffset);
if(SunRise!="") {

  Moondata =
      MoonRashiCalc.getMoondata(SunRise, SunSet, NextSunRise, NextSunSet,PrevSunRise,PrevSunSet,MoonAge,Solar_deg.toString(),Hora_map!);
  CRashi = Moondata[0];
  CNkh = Moondata[1];
  graha = Moondata[2];
  Rahukal = Moondata[3];
  days = Moondata[4];
  cday = double.parse(Moondata[5]);
  Hora_duration=Moondata[6];
  Hora_start=Moondata[7];
  Hora_end=Moondata[8];
  rahukaalstartTime=Moondata[9];
  rahukaalendTime=Moondata[10];
  YogData =
      MoonYogCalc.getYogData(cday, SunRise, SunSet, NextSunRise, NextSunSet);
  Yog_str = YogData[0];
  Fal_str = YogData[1];
  yoggood = YogData[5];
  //print("cday${SunData[5]}");
  //print("cdayc$cday");

  // 22.161346
var calc_moonage=double.parse(MoonAge)+0.000011;
  MoonAge=calc_moonage.toStringAsFixed(6);

  //cday=126.5177;
  current_Time = "${Time_Format(DateTime
      .now()
      .hour)} : ${Time_Format(DateTime.now().minute)} : ${Time_Format(DateTime
      .now()
      .second)}";
}

    // });



  }

  Future <void> scheduleDailyTenAMNotification() async {

    await _notificationsPlugin.zonedSchedule(
        999,
        'daily scheduled notification title',
        'daily scheduled notification body',
        nextInstanceOfTenAM(),
     // tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
        const NotificationDetails(
          android: AndroidNotificationDetails('main_channel', 'Main Channel',
              channelDescription: "ashwin",
              importance: Importance.max,
              priority: Priority.max),
        ),

        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,);
        //matchDateTimeComponents: DateTimeComponents.time);
  }
   tz.TZDateTime nextInstanceOfTenAM() {
    print("Here in TZ");
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour, now.minute,now.second);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(seconds: 30));

    }
    print(scheduledDate.toString());
    return scheduledDate;
  }
 String Time_Format(num)
  {
    if(num.toString().length==1)
      {
        return "0$num";
      }
    else
      {
        return "$num";
      }
  }
test()
{
  var DateSec="${(DateTime.now().microsecondsSinceEpoch/1000000).round()}";
  print("lat$lat");
  print("long$long");
  update();
}
  Future getMoonPhaseSummeryList() async{


    try{
      // lat=commonStorage.box.read('lat').toString();
      // long=commonStorage.box.read('long').toString();
      // TimeZone=commonStorage.box.read('TimeZone').toString();
      print('In API Call4');
      var transactionSummeryDetails = await RemoteServices.fetchTSLis('http://api.farmsense.net/v1/moonphases/?d=$today');
      print("logoutDetails : $transactionSummeryDetails");
      Moonphase = transactionSummeryDetails;
getData(Moonphase);
      MoonAge=Moonphase[0].age.toStringAsFixed(6);
      MoonIllumination=Moonphase[0].illumination.toString();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("MoonAge",MoonAge );
      update();
    }finally{

    }

  }
  Future getSunSummeryList() async{

  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //  // await sharedPreferences.setString("lat",lat );
  //   var val1= sharedPreferences.getString("lat");
  //  // await sharedPreferences.setString("long",long );
  //   var val2 = sharedPreferences.getString("long");
  // //  await sharedPreferences.setString("TimeZone",TimeZone );
  //   var val3= sharedPreferences.getString("TimeZone");
  //
  //   print("sharedPreferences- $val1-$val2-$val3");

    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      lat=sharedPreferences.getString("lat").toString();
      long=sharedPreferences.getString("long").toString();
      TimeZone=sharedPreferences.getString("TimeZone").toString();
      print("sharedPreferences- $lat-$long-$TimeZone");
      print('In API Call1');
      var transactionSummeryDetails = await RemoteServices.fetchSunriseData('http://api.farmsense.net/v1/daylengths/?d=$today&lat=$lat&lon=$long&tz=$TimeZone');
      //print("logoutDetails : $transactionSummeryDetails");
      SunriseData = transactionSummeryDetails;
     // getData(SunriseData);
      SunRise=SunriseData[0].sunrise;
      SunSet=SunriseData[0].sunset;

      await sharedPreferences.setString("SunRise",SunRise );
      await sharedPreferences.setString("SunSet",SunSet );
      update();
    }finally{

    }

  }
  Future getNextdaySunSummeryList() async{


    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      lat=sharedPreferences.getString("lat").toString();
      long=sharedPreferences.getString("long").toString();
      TimeZone=sharedPreferences.getString("TimeZone").toString();
      print("sharedPreferences- $lat-$long-$TimeZone");

      print('In API Call2');
      var transactionSummeryDetails = await RemoteServices.fetchSunriseData('http://api.farmsense.net/v1/daylengths/?d=$nextDay&lat=$lat&lon=$long&tz=$TimeZone');
     // print("logoutDetails : $transactionSummeryDetails");
      NextSunriseData = transactionSummeryDetails;
      // getData(SunriseData);
      NextSunRise=NextSunriseData[0].sunrise;
     // print("NextSunRise$NextSunRise");
      NextSunSet=NextSunriseData[0].sunset;
      await sharedPreferences.setString("NextSunRise",NextSunRise );
      await sharedPreferences.setString("NextSunSet",NextSunSet );
      update();
    }finally{

    }

  }

  Future getPrevdaySunSummeryList() async{

    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      lat=sharedPreferences.getString("lat").toString();
      long=sharedPreferences.getString("long").toString();
      TimeZone=sharedPreferences.getString("TimeZone").toString();
      print("sharedPreferences- $lat-$long-$TimeZone");
      print('In API Call3');
      print('lat=$lat&lon=$long&tz=$TimeZone');
      var transactionSummeryDetails = await RemoteServices.fetchSunriseData('http://api.farmsense.net/v1/daylengths/?d=$prevDay&lat=$lat&lon=$long&tz=$TimeZone');
      //print("logoutDetails : $transactionSummeryDetails");
      PrevSunriseData = transactionSummeryDetails;
      // getData(SunriseData);
      PrevSunRise=PrevSunriseData[0].sunrise;
     // print("NextSunRise$NextSunRise");
      PrevSunSet=PrevSunriseData[0].sunset;
      await sharedPreferences.setString("PrevSunRise",PrevSunRise);
      await sharedPreferences.setString("PrevSunSet",PrevSunSet );
      update();
    }finally{

    }

  }

  checkGps() async {
    print('In checkGps');
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        update();

        getLocation();
        print('In checkGps2');
      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    update();
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
    print("Geolocation");
    long = position.longitude.toString();
    lat = position.latitude.toString();

    update();

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      //getSunSummeryList();
     // getNextdaySunSummeryList();
     // getMoonPhaseSummeryList();
     // getPrevdaySunSummeryList();
      Hora_map={0:Hora_Sunday_list,1:hora_Monday_list,2:hora_Tuesday_list,3:hora_Wednesday_list,
        4:hora_Thursday_list,5:hora_Friday_list,6:hora_Saturday_list,7:Hora_Sunday_list};

      update();

    });
  }

  void getData(moonphase) {

    print(moonphase[0].illumination);
  }
  PageController controller = PageController();
  var pageindicator = 0;
  indicator(page){
    pageindicator = page;
    print("page $page");
    update();
  }
  background_calculate ()async
  {
    print("background_calculate if" );
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SunCalc.getSundata(0.00);
    Solar_deg=int.parse(SunData[5]);
    SunRise=await sharedPreferences.getString("SunRise").toString();
    SunSet=await sharedPreferences.getString("SunSet").toString();
    NextSunRise=await sharedPreferences.getString("NextSunRise").toString();
    NextSunSet=await sharedPreferences.getString("PrevSunRise").toString();
    PrevSunRise=await sharedPreferences.getString("PrevSunRise").toString();
    PrevSunSet=await sharedPreferences.getString("PrevSunSet").toString();
    MoonAge=await sharedPreferences.getString("MoonAge").toString();
    print("SunRise$SunRise");
    if(SunRise!="") {
      print("background_calculate if2" );
      MoonRashiCalc.getMoondata(
          SunRise,
          SunSet,
          NextSunRise,
          NextSunSet,
          PrevSunRise,
          PrevSunSet,
          MoonAge,
          Solar_deg.toString(),
          Hora_map!);
    }
    else{
      print("background_calculate $SunRise" );
    }
  }
}