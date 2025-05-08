
import 'package:auspi_agni_flutter/auspi_moon_calc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
class moon_rashi_calc
{
  auspi_moon_calc MoonCalc = new auspi_moon_calc();
  var graha="";
  var CurrentTimeDayhora=0;
  var Hora_start="";
  var Hora_end="";
  var Hora_duration="";

  var equalTime= 0.00;
  var equalNightTime= 0.00;
  var dayNight="day";
  var notificationSet=false;
  var rahukaal_start="";
  var rahukaal_end="";
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  List<String> getMoondata(String SunRise,String SunSet,String NextSunRise,String NextSunSet,String PrevSunRise,String PrevSunSet,MoonAge,Solar_deg, Hora_map) {


    print("Hora_Sunday_list ${Hora_map!}");
    //Calendar calendar= Calendar.getInstance();

    //double DateSec =calendar.getTime().getTime()/1000;
    //moon_calc=MoonCalc.phase(double.parse(DateSec));
    // print(DateSec);
    // print(moon_calc[1]);
    var  moon_calc;
    var cday;
    //cday=moon_calc[1]+7;
    //print(cday);
    var CNkh;
    var day=DateTime.now().weekday;
    var hour=DateTime.now().hour;
     print("DayofWeek$day");
    var rgood;
    var rbad;
    var app;
    var ngood;
    var nbad;
    var CRashi="";
    var days="";

    var snd=true;
    var Rahukal="";
    var Yog_str;
    var Fal_str;
    var yogbad;
    var yoggood;
    var j=DateTime.now().minute;
    List rashi = ["Mesh","Mesh","Vrushabh","Mithun","Karka",
      "Sinha","Kanya","Tula","Vrushchik","Dhanu","Makar","Kumbha","Meen"];


    int mth = DateTime.now().month;
    int cmpTo = 0;
    int cmpdate = DateTime.now().day;

    //var CurrentTime=(DateTime.now().microsecondsSinceEpoch/1000000).round();
    var  today=DateTime.now();
    var nextDay=DateTime.now().add(Duration(days: 1));
    var prevDay=DateTime.now().subtract(Duration(days: 1));

    var  today1=DateTime.now();
    var nextDay1=DateTime.now().add(Duration(days: 1));
    var prevDay1=DateTime.now().subtract(Duration(days: 1));

   // var CurrentTime=(DateTime(DateTime.now().year,DateTime.now().month,prevDay1.day,7,52,0).microsecondsSinceEpoch/1000000).round();
   // var CurrentDate=DateTime(DateTime.now().year,DateTime.now().month,prevDay1.day,7,52,0);
    var CurrentDate=today;
    var CurrentTime=(DateTime.now().microsecondsSinceEpoch/1000000).round();




    var TodaySunRiseSplit=SunRise.split(":");
    var NextSunRiseSplit=NextSunRise.split(":");
    var PrevSunRiseSplit=PrevSunRise.split(":");


    var SetTodaySunriseTime=((DateTime(today.year,today.month,today.day,int.parse(TodaySunRiseSplit[0]),int.parse(TodaySunRiseSplit[1]),int.parse(TodaySunRiseSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetNextSunriseTime=((DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunRiseSplit[0]),int.parse(NextSunRiseSplit[1]),int.parse(NextSunRiseSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetPrevSunriseTime=((DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunRiseSplit[0]),int.parse(PrevSunRiseSplit[1]),int.parse(PrevSunRiseSplit[2]))).microsecondsSinceEpoch/1000000).round();

    var SetTodaySunriseDate=DateTime(today.year,today.month,today.day,int.parse(TodaySunRiseSplit[0]),int.parse(TodaySunRiseSplit[1]),int.parse(TodaySunRiseSplit[2]));
    var SetNextSunriseDate=DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunRiseSplit[0]),int.parse(NextSunRiseSplit[1]),int.parse(NextSunRiseSplit[2]));
    var SetPrevSunriseDate=DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunRiseSplit[0]),int.parse(PrevSunRiseSplit[1]),int.parse(PrevSunRiseSplit[2]));

    var TodaySunSetSplit=SunSet.split(":");
    var NextSunSetSplit=NextSunSet.split(":");
    var PrevSunSetSplit=PrevSunSet.split(":");

    var SetTodaySunsetTime=((DateTime(today.year,today.month,today.day,int.parse(TodaySunSetSplit[0]),int.parse(TodaySunSetSplit[1]),int.parse(TodaySunSetSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetNextSunsetTime=((DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunSetSplit[0]),int.parse(NextSunSetSplit[1]),int.parse(NextSunSetSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetPrevSunsetTime=((DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunSetSplit[0]),int.parse(PrevSunSetSplit[1]),int.parse(PrevSunSetSplit[2]))).microsecondsSinceEpoch/1000000).round();

    var SetTodaySunsetDate=DateTime(today.year,today.month,today.day,int.parse(TodaySunSetSplit[0]),int.parse(TodaySunSetSplit[1]),int.parse(TodaySunSetSplit[2]));
    var SetNextSunsetDate=DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunSetSplit[0]),int.parse(NextSunSetSplit[1]),int.parse(NextSunSetSplit[2]));
    var SetPrevSunsetDate=DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunSetSplit[0]),int.parse(PrevSunSetSplit[1]),int.parse(PrevSunSetSplit[2]));

    print("CurrentDate$CurrentDate");
    if(CurrentTime >= SetTodaySunriseTime ) {
      print("herinif");

      if(CurrentTime >= SetTodaySunsetTime)
      {
        print("herinifelseif");

        var NightTime = SetNextSunriseDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeNow = CurrentDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeEqual = NightTime / 12;
        dayNight="night";
        equalNightTime=NighttimeEqual;
        CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
        var calc=(CurrentTimeDayhora*NighttimeEqual).floor();
        var horastartTime=SetTodaySunsetDate.add(Duration(minutes: calc));
        var horaendTime=SetTodaySunsetDate.add(Duration(minutes: (calc+NighttimeEqual).floor()));

        Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
        print("$Hora_start");
        Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
        Hora_duration="${NighttimeEqual.floor()}";

        CurrentTimeDayhora = CurrentTimeDayhora + 18;
        if (CurrentTimeDayhora >= 24) {
          CurrentTimeDayhora = CurrentTimeDayhora - 24;
        }

      //  var horastartTime=SetTodaySunsetDate.add(Duration(minutes: calc));


      //  print("CurrentTimeNighthora$NightTime");
      //  print("CurrentTimeNighthora$NighttimeNow");
      //  print("CurrentTimeNighthora$NighttimeEqual");
        print("CurrentTimeNighthora$CurrentTimeDayhora");
      }
      else {
        var Daytime = SetTodaySunsetDate
            .difference(SetTodaySunriseDate)
            .inMinutes;


        var DaytimeNow = CurrentDate
            .difference(SetTodaySunriseDate)
            .inMinutes;
        var DaytimeEqual = Daytime / 12;
        dayNight="day";
        equalTime=DaytimeEqual;
        CurrentTimeDayhora = (DaytimeNow / DaytimeEqual).floor();
       // CurrentTimeDayhora=(CurrentTimeDayhora/60).floor();
        var calc=(CurrentTimeDayhora*DaytimeEqual).floor();
        var horastartTime=SetTodaySunriseDate.add(Duration(minutes: calc));
        var horaendTime=SetTodaySunriseDate.add(Duration(minutes: (calc+DaytimeEqual).floor()));
        Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
        Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
        Hora_duration="${DaytimeEqual.floor()}";
        CurrentTimeDayhora = CurrentTimeDayhora + 6;
        if (CurrentTimeDayhora >= 18) {
          CurrentTimeDayhora = CurrentTimeDayhora - 18;
        }

       // print("CurrentTimeDayhora$calc");
       // print("CurrentTimeDayhora$horastartTime");
      //  print("CurrentTimeDayhora$horaendTime");
      //  print("CurrentTimeDayhora$Daytime");
       // print("CurrentTimeDayhora$DaytimeNow");
       // print("CurrentTimeDayhora$DaytimeEqual");
        print("CurrentTimeDayhora$CurrentTimeDayhora");
      }
    }
  /*  else if(CurrentTime >= SetTodaySunsetTime)
      {
        print("herinelseif");
        var NightTime = SetNextSunriseDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeNow = CurrentDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeEqual = NightTime / 12;
        CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
        CurrentTimeDayhora = CurrentTimeDayhora + 18;
        if (CurrentTimeDayhora >= 24) {
          CurrentTimeDayhora = CurrentTimeDayhora - 24;
        }


        print("CurrentTimeNighthora$NightTime");
        print("CurrentTimeNighthora$NighttimeNow");
        print("CurrentTimeNighthora$NighttimeEqual");
        print("CurrentTimeNighthora$CurrentTimeDayhora");
      }*/
    else if(CurrentTime < SetTodaySunriseTime)
    {
      print("herinelseif");
      var NightTime = SetTodaySunriseDate
          .difference(SetPrevSunsetDate)
          .inMinutes;
      var NighttimeNow = CurrentDate
          .difference(SetPrevSunsetDate)
          .inMinutes;
      var NighttimeEqual = NightTime / 12;
      dayNight="night";
      equalNightTime=NighttimeEqual;
      CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
      var calc=(CurrentTimeDayhora*NighttimeEqual).floor();
      var horastartTime=SetPrevSunsetDate.add(Duration(minutes: calc));
      var horaendTime=SetPrevSunsetDate.add(Duration(minutes: (calc+NighttimeEqual).floor()));
      Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
      Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
      Hora_duration="${NighttimeEqual.floor()}";
      CurrentTimeDayhora = CurrentTimeDayhora + 18;
      if (CurrentTimeDayhora >= 24) {
        CurrentTimeDayhora = CurrentTimeDayhora - 24;
      }


     // print("CurrentTimeDayhora$NightTime");
    //  print("CurrentTimeDayhora$NighttimeNow");
    //  print("CurrentTimeDayhora$NighttimeEqual");
      print("CurrentTimeDayhora$CurrentTimeDayhora");
    }
    else
      {
        print("herinelse");
        var Daytime = SetTodaySunsetDate
            .difference(SetTodaySunriseDate)
            .inMinutes;


        var DaytimeNow = CurrentDate
            .difference(SetTodaySunriseDate)
            .inMinutes;
        var DaytimeEqual = Daytime / 12;
        dayNight="day";
        equalTime=DaytimeEqual;
        CurrentTimeDayhora = (DaytimeNow / DaytimeEqual).floor();
        var calc=(CurrentTimeDayhora*DaytimeEqual).floor();
        var horastartTime=SetTodaySunriseDate.add(Duration(minutes: calc));
        var horaendTime=SetTodaySunriseDate.add(Duration(minutes: (calc+DaytimeEqual).floor()));
        Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
        Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
        Hora_duration="${DaytimeEqual.floor()}";
        CurrentTimeDayhora = CurrentTimeDayhora + 6;
        if (CurrentTimeDayhora >= 18) {
          CurrentTimeDayhora = CurrentTimeDayhora - 18;
        }


       // print("CurrentTimeDayhora$Daytime");
       // print("CurrentTimeDayhora$DaytimeNow");
       // print("CurrentTimeDayhora$DaytimeEqual");
        print("CurrentTimeDayhora$CurrentTimeDayhora");
      }
    //print(DateTime.fromMillisecondsSinceEpoch(CurrentTimeDayhora));
    //var DateSec=DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,7,12,0);


    /***** Notification Logic start ******/

    var RahutimeNow = SetTodaySunsetDate
        .difference(SetTodaySunriseDate)
        .inMinutes;
    var RahutimeEqual = RahutimeNow / 8;
    Map RahuTimeDaywise ={0:7,1:1,2:6,3:4,4:5,5:3,6:2,7:7};

    var rahuCalc= RahuTimeDaywise[day]*RahutimeEqual;
    var rahukaalstartTime=SetTodaySunriseDate.add(Duration(minutes: rahuCalc.floor()));
    var rahukaalendTime=SetTodaySunriseDate.add(Duration(minutes: (rahuCalc+RahutimeEqual).floor()));
    rahukaal_start="${rahukaalstartTime.hour} : ${rahukaalstartTime.minute} : ${rahukaalstartTime.second}";
    rahukaal_end="${rahukaalendTime.hour} : ${rahukaalendTime.minute} : ${rahukaalendTime.second}";
    var rahukaalstartEarlyNotify=rahukaalstartTime.subtract(Duration(minutes: 60));
    print("Today  $day");
    print("rahukaalstartTime  $rahukaalstartTime");
    print("rahukaalendTime  $rahukaalendTime");
    print("Day or Night  $dayNight");
    print("Equaltime  $equalTime");
    print("Equaltime  $equalNightTime");
    if(!notificationSet) {
      final tz.TZDateTime now2 = tz.TZDateTime.now(tz.local);
      if(rahukaalstartEarlyNotify.isAfter(now2)) {
        // scheduleDailyTenAMNotification(98, "Rahu Kaal will start in an Hour.",
        //     "Rahu Kaal ${rahukaalstartTime}", rahukaalstartEarlyNotify);
      }
        if(rahukaalstartTime.isAfter(now2)) {
          // scheduleDailyTenAMNotification(97, "Rahu Kaal Started",
          //     "Rahu Kaal \n(Starts:${rahukaalstartTime}) \n(Ends:${rahukaalendTime})",
          //     rahukaalstartTime);
        }
        if(rahukaalendTime.isAfter(now2)) {
        // scheduleDailyTenAMNotification(
        //     96, "Rahu Kaal Ended", "Rahu Kaal Ends.", rahukaalendTime);
      }
      equalTime=0.00;
        for (var i = 0; i < 24; i++) {
          if (i < 12) {
            var calc = (i * equalTime).floor();

            var NotifystartTime = SetTodaySunriseDate.add(
                Duration(minutes: calc));
           var CurrentTime=(NotifystartTime.microsecondsSinceEpoch/1000000).round();
            if(CurrentTime >= SetTodaySunriseTime ) {
           //    print("1-if");
           //    if(CurrentTime >= SetTodaySunsetTime)
           //    {
           //      print("1-if-if");
           //      var NightTime = SetNextSunriseDate
           //          .difference(SetTodaySunsetDate)
           //          .inMinutes;
           //      var NighttimeNow = CurrentDate
           //          .difference(SetTodaySunsetDate)
           //          .inMinutes;
           //      var NighttimeEqual = NightTime / 12;
           //      dayNight="night";
           //      equalNightTime=NighttimeEqual;
           //    }
           //    else {
                print("1-if-else");
                var Daytime = SetTodaySunsetDate
                    .difference(SetTodaySunriseDate)
                    .inMinutes;
                var DaytimeNow = CurrentDate
                    .difference(SetTodaySunriseDate)
                    .inMinutes;
                var DaytimeEqual = Daytime / 12;
                dayNight="day";
                equalTime=DaytimeEqual;
              }
           //  }
           //  else if(CurrentTime < SetTodaySunriseTime)
           //  {
           //    print("1-elseif");
           //    var NightTime = SetTodaySunriseDate
           //        .difference(SetPrevSunsetDate)
           //        .inMinutes;
           //    var NighttimeNow = CurrentDate
           //        .difference(SetPrevSunsetDate)
           //        .inMinutes;
           //    var NighttimeEqual = NightTime / 12;
           //    dayNight="night";
           //    equalNightTime=NighttimeEqual;
           //  }
           //  else
           //  {
           //    print("1-else");
           //    var Daytime = SetTodaySunsetDate
           //        .difference(SetTodaySunriseDate)
           //        .inMinutes;
           //    var DaytimeNow = CurrentDate
           //        .difference(SetTodaySunriseDate)
           //        .inMinutes;
           //    var DaytimeEqual = Daytime / 12;
           //    dayNight="day";
           //    equalTime=DaytimeEqual;
           //  }

            var horahours = i + 6;
            if (horahours > 24)
              horahours = horahours - 24;
            var NotifyHora = Hora_map![day][horahours];

            print(
                "NotifystartTime:  $NotifystartTime -- NotifyHora:  $NotifyHora");
          //  final tz.TZDateTime now2 = tz.TZDateTime.now(tz.local);
            if(NotifystartTime.isAfter(now2)) {
              // scheduleDailyTenAMNotification(
              //     i, "New Hora Started", "$NotifyHora", NotifystartTime);
            }
          }
          else{

            var calc = ((i-12) * equalNightTime).floor();

            var NotifystartTime = SetTodaySunsetDate.add(
                Duration(minutes: calc));
            //print("NotifystartTime: $NotifystartTime");
            var CurrentTime=(NotifystartTime.microsecondsSinceEpoch/1000000).round();
            if(CurrentTime >= SetTodaySunriseTime ) {
              //print("2-if");
              if(CurrentTime >= SetTodaySunsetTime)
              {
               // print("2-if-if");
                var NightTime = SetNextSunriseDate
                    .difference(SetTodaySunsetDate)
                    .inMinutes;
                var NighttimeNow = CurrentDate
                    .difference(SetTodaySunsetDate)
                    .inMinutes;
                var NighttimeEqual = NightTime / 12;
                dayNight="night";
                equalNightTime=NighttimeEqual;
              }
              else {
               // print("2-if-else");
                var Daytime = SetTodaySunsetDate
                    .difference(SetTodaySunriseDate)
                    .inMinutes;
                var DaytimeNow = CurrentDate
                    .difference(SetTodaySunriseDate)
                    .inMinutes;
                var DaytimeEqual = Daytime / 12;
                dayNight="day";
                equalTime=DaytimeEqual;
              }
            }
            else if(CurrentTime < SetTodaySunriseTime)
            {
             // print("2-elseif");

              var NightTime = SetTodaySunriseDate
                  .difference(SetPrevSunsetDate)
                  .inMinutes;
              var NighttimeNow = CurrentDate
                  .difference(SetPrevSunsetDate)
                  .inMinutes;
              var NighttimeEqual = NightTime / 12;
              dayNight="night";
              equalNightTime=NighttimeEqual;
            }
            else
            {
              //print("2-else");
              var Daytime = SetTodaySunsetDate
                  .difference(SetTodaySunriseDate)
                  .inMinutes;
              var DaytimeNow = CurrentDate
                  .difference(SetTodaySunriseDate)
                  .inMinutes;
              var DaytimeEqual = Daytime / 12;
              dayNight="day";
              equalTime=DaytimeEqual;
            }
            var horahours = i + 6;
            if (horahours > 24)
              horahours = horahours - 24;
            var NotifyHora = Hora_map![day][horahours];
            if((i+6)<22) {
            print(
                "NotifystartTime:  $NotifystartTime -- NotifyHora:  $NotifyHora");
           // final tz.TZDateTime now2 = tz.TZDateTime.now(tz.local);
            if(NotifystartTime.isAfter(now2)) {
              // scheduleDailyTenAMNotification(
              //     i, "New Hora Started", "$NotifyHora", NotifystartTime);
            }
            }
          }
        }

      scheduleDailyTenAMNotification(
          99, "Good Morning!!!", "Open AuspiWatch once to get today's Hora Notifications.",SetNextSunriseDate );
      scheduleDailynewTempNotification();
    }
    notificationSet=true;
    /* Notification Logic end */

    var DateSec="${(DateTime.now().microsecondsSinceEpoch/1000000)}";
    //print(DateTime.now());
    //var DateSec2="${(DateSec.microsecondsSinceEpoch/1000000)}";
    print(DateSec);
    var year=DateTime.now().year;
    // print(year);
    // print(cmpdate);
    moon_calc=MoonCalc.phase(double.parse(DateSec));
    // print(DateSec);
    // print(moon_calc[1]);

    //cday=moon_calc[1]+5;
    cday=moon_calc[1];
    print("CLASScday$cday");
    //cday=(double.parse(MoonAge)*12.2);
    cday=(double.parse(MoonAge)*12.2);
    cday=cday+double.parse(Solar_deg);
    print("CLASScday$cday");
    if(cday>=360.00)
      cday=cday-360.00;
    print("MOONPHASE${moon_calc[0]}");

    ////hour=5;
   // print("HOUR$hour");
    // day=7;

    /*Moon Rashi Data Starts */
    if(day == 7 && CurrentTime >= SetTodaySunriseTime || day == 7 && SetTodaySunsetTime<CurrentTime || day == 1 && CurrentTime < SetTodaySunriseTime)
    {
      print("herre$day");

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=true;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=false;
        rbad=true;
        app=false;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=false;
        rbad=false;
        app=false;
      }
      /*Moon Rashi Data Ends*/
/*Moon Nakshatra Data Start*/
      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=true;
        nbad=false;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=false;
        nbad=false;
      }
/*Moon Nakshatra Data End*/

      /*Anandadi Yog and Rahu kal Start*/

//Map Hora_map= {"day":"Sunday",
//"Horas":Hora_Sunday_list};
//Hora_map[0]["Horas"];
      days = "Sunday";

      //Hora_map[0][Hora_Sunday_list];
      //  Image im1 = Image.createImage("/SUNDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
      graha=Hora_map[7][CurrentTimeDayhora];

    } else
    if(day == 1 && CurrentTime >= SetTodaySunriseTime || day == 1 && SetTodaySunsetTime<CurrentTime || day == 2 && CurrentTime < SetTodaySunriseTime)
    {

      print("here2");
      if(cday<=0)
      {
        cday=360+cday;

      }

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=true;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=true;
        app=false;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=false;
        rbad=false;
        app=false;
      }

      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=true;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=false;
        nbad=true;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=false;
        nbad=false;
      }
      //   g.setColor(0x56bbed);
      //   g.fillArc(10,i1+63, 20, 20, 0, 360);

      days = "Monday";

      //Image im1 = Image.createImage("/MONDAY_htc.png");
      // g.drawImage(im1, -225, -225, 20);
      graha=Hora_map[1][CurrentTimeDayhora];

    } else
    if(day == 2 && CurrentTime >= SetTodaySunriseTime || day == 2 && SetTodaySunsetTime<CurrentTime || day == 3 && CurrentTime < SetTodaySunriseTime)
    {
      print("here3");
      if(cday<=0)
      {
        cday=360+cday;

      }

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=false;
        rbad=true;
        app=false;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=true;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=false;
        rbad=false;
        app=false;
      }

      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=false;
        nbad=false;
      }
      //    g.setColor(0x008ed2);
      //g.fillArc(10,i1+63, 20, 20, 0, 360);

      days = "Tuesday";


      //Image im1 = Image.createImage("/TUESDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
      graha=Hora_map[2][CurrentTimeDayhora];

    } else
    if(day == 3 && CurrentTime >= SetTodaySunriseTime || day == 3 && SetTodaySunsetTime<CurrentTime || day == 4 && CurrentTime < SetTodaySunriseTime)
    {
      print("here4");
      if(cday<=0)
      {
        cday=360+cday;

      }

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=true;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=false;
        rbad=true;
        app=false;
      }

      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=false;
        nbad=true;
      }
      //   g.setColor(0xf8c300);
      //    g.fillArc(10,i1+63, 20, 20, 0, 360);

      days = "Wednesday";


      //Image im1 = Image.createImage("/WEDNESDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
      graha=Hora_map[3][CurrentTimeDayhora];

    } else
    if(day == 4 && CurrentTime >= SetTodaySunriseTime || day == 4 && SetTodaySunsetTime<CurrentTime || day == 5 && CurrentTime < SetTodaySunriseTime)
    {
      print("Thursday");
      if(cday<=0)
      {
        cday=360+cday;

      }

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=true;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=false;
        rbad=true;
        app=false;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=false;
        rbad=false;
        app=true;
      }

      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=true;
        nbad=false;
      }
      //      g.setColor(0xdd137b);
      //      g.fillArc(10,i1+63, 20, 20, 0, 360);

      days = "Thursday";


      //Image im1 = Image.createImage("/ThURSDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
      graha=Hora_map[4][CurrentTimeDayhora];

    } else
    if(day == 5 && CurrentTime >= SetTodaySunriseTime || day == 5 && SetTodaySunsetTime<CurrentTime || day == 6 && CurrentTime < SetTodaySunriseTime)
    {
      if(cday<=0)
      {
        cday=360+cday;

      }

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=false;
        rbad=true;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=true;
        rbad=false;
        app=false;
      }

      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=true;
        nbad=false;
      }

      //   g.setColor(0x83c346);
      //   g.fillArc(10,i1+63, 20, 20, 0, 360);

      days = "Friday";


      // Image im1 = Image.createImage("/FRIDAY_htc.png");
      // g.drawImage(im1, -225, -225, 0);
      graha=Hora_map[5][CurrentTimeDayhora];

    } else
    if(day == 6 && CurrentTime >= SetTodaySunriseTime || day == 6 && SetTodaySunsetTime<CurrentTime || day == 7 && CurrentTime < SetTodaySunriseTime)
    {
      if(cday<=0)
      {
        cday=360+cday;

      }

      if(cday<=(9.0*1.0*360.0/108.0))
      {
        CRashi=rashi[1];
        rgood=false;
        rbad=true;
        app=false;
      }

      else if(cday<=(9.0*2.0*360.0/108.0))
      {
        CRashi=rashi[2];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*3.0*360.0/108.0))
      {
        CRashi=rashi[3];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*4.0*360.0/108.0))
      {
        CRashi=rashi[4];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*5.0*360.0/108.0))
      {
        CRashi=rashi[5];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*6.0*360.0/108.0))
      {
        CRashi=rashi[6];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*7.0*360.0/108.0))
      {
        CRashi=rashi[7];
        rgood=true;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*8.0*360.0/108.0))
      {
        CRashi=rashi[8];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*9.0*360.0/108.0))
      {
        CRashi=rashi[9];
        rgood=false;
        rbad=false;
        app=false;
      }

      else if(cday<=(9.0*10.0*360.0/108.0))
      {
        CRashi=rashi[10];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*11.0*360.0/108.0))
      {
        CRashi=rashi[11];
        rgood=false;
        rbad=false;
        app=true;
      }

      else if(cday<=(9.0*12.0*360.0/108.0))
      {
        CRashi=rashi[12];
        rgood=false;
        rbad=false;
        app=false;
      }

      if(cday<=(4.0*1.0*360.0/108.0))
      {
        CNkh="Ashwini";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*2.0*360.0/108.0))
      {
        CNkh="Bharani";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*3.0*360.0/108.0))
      {
        CNkh="Krutika";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*4.0*360.0/108.0))
      {
        CNkh="Rohini";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*5.0*360.0/108.0))
      {
        CNkh="Mruga";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*6.0*360.0/108.0))
      {
        CNkh="Ardra";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*7.0*360.0/108.0))
      {
        CNkh="Punarvasu";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*8.0*360.0/108.0))
      {
        CNkh="Pushya";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*9.0*360.0/108.0))
      {
        CNkh="Ashlesha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*10.0*360.0/108.0))
      {
        CNkh="Magha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*11.0*360.0/108.0))
      {
        CNkh="Purva Falgun";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*12.0*360.0/108.0))
      {
        CNkh="Uttara Falgun";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*13.0*360.0/108.0))
      {
        CNkh="Hasta";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*14.0*360.0/108.0))
      {
        CNkh="Chitra";
        ngood=false;
        nbad=true;
      }
      else if(cday<=(4.0*15.0*360.0/108.0))
      {
        CNkh="Swati";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*16.0*360.0/108.0))
      {
        CNkh="Vishakha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*17.0*360.0/108.0))
      {
        CNkh="Anuradha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*18.0*360.0/108.0))
      {
        CNkh="Jyeshtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*19.0*360.0/108.0))
      {
        CNkh="Mula";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*20.0*360.0/108.0))
      {
        CNkh="Poorvashadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
      {
        CNkh="UttaraShadha";
        ngood=false;
        nbad=false;
      }
      else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
      {
        CNkh="Abijat";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*22.0*360.0/108.0))
      {
        CNkh="Shravan";
        ngood=true;
        nbad=false;
      }
      else if(cday<=(4.0*23.0*360.0/108.0))
      {
        CNkh="Dhanishtha";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*24.0*360.0/108.0))
      {
        CNkh="Shatataraka";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*25.0*360.0/108.0))
      {
        CNkh="PoorvaBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*26.0*360.0/108.0))
      {
        CNkh="UttaraBhadrapada";
        ngood=false;
        nbad=false;
      }
      else if(cday<=(4.0*27.0*360.0/108.0))
      {
        CNkh="Revati";
        ngood=false;
        nbad=false;
      }
      //    g.setColor(0x006d33);
      //   g.fillArc(10,i1+63, 20, 20, 0, 360);

      days = "Saturday";


      //Image im1 = Image.createImage("/SATURDAY_htc.png");
      // g.drawImage(im1, -225, -225, 0);
      graha=Hora_map[6][CurrentTimeDayhora];

    } else

    {
      // Image im1 = Image.createImage("/SATURDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
    }
    List<String> return_value=[CRashi,CNkh,graha,Rahukal,days,"$cday",Hora_duration,Hora_start,Hora_end,rahukaal_start,rahukaal_end];
    print(return_value);
    return return_value;

  }
  Future <void> scheduleDailyTenAMNotification(int i, String title,String body,NotifystartTime) async {

    await _notificationsPlugin.zonedSchedule(
      i,
      title,
      body,
      nextInstanceOfTenAM(NotifystartTime),
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
    //matchDateTimeComponents: DateTimeCofmponents.time);
  }
  tz.TZDateTime nextInstanceOfTenAM(NotifystartTime) {
   // print("Here in TZ");
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, NotifystartTime.year, NotifystartTime.month,
        NotifystartTime.day, NotifystartTime.hour, NotifystartTime.minute,NotifystartTime.second);
    if (scheduledDate.isBefore(now)) {
      //scheduledDate = scheduledDate.add(const Duration(seconds: 30));

    }
    print(scheduledDate.toString());
    return scheduledDate;
  }
  Future <void> scheduleDailynewTempNotification() async {

    await _notificationsPlugin.zonedSchedule(
      999,
      'In MoonCalc',
      'Calculations Done.',
      newTempNotification(),
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
  tz.TZDateTime newTempNotification() {
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
}
