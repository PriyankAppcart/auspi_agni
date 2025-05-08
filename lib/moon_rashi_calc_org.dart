
import 'package:auspi_agni_flutter/auspi_moon_calc.dart';

class moon_rashi_calc
{
  auspi_moon_calc MoonCalc = new auspi_moon_calc();

  List<String> getMoondata(SunRise,SunSet,NextSunRise,NextSunSet) {
    var  moon_calc;
    //Calendar calendar= Calendar.getInstance();

    //double DateSec =calendar.getTime().getTime()/1000;
    //moon_calc=MoonCalc.phase(double.parse(DateSec));
    // print(DateSec);
    // print(moon_calc[1]);
    var cday;
    //cday=moon_calc[1]+7;
    //print(cday);
    var CNkh;
    var day=DateTime.now().weekday;
    var hour=DateTime.now().hour;
    // print(day);
    var rgood;
    var rbad;
    var app;
    var ngood;
    var nbad;
    var CRashi;
    var days="";
    var graha;
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

    var  today=DateTime.now();
    var nextDay=DateTime.now().add(Duration(days: 1));
    var TodaySunRiseSplit=SunRise.split(":");
    var NextSunRiseSplit=NextSunRise.split(":");
    var SetTodaySunriseTime=((DateTime(today.year,today.month,today.day,TodaySunRiseSplit[0],TodaySunRiseSplit[1],TodaySunRiseSplit[2])).microsecondsSinceEpoch/1000000).round();
    var SetNextSunriseTime=((DateTime(nextDay.year,nextDay.month,nextDay.day,NextSunRiseSplit[0],NextSunRiseSplit[1],NextSunRiseSplit[2])).microsecondsSinceEpoch/1000000).round();


    var TodaySunSetSplit=SunSet.split(":");
    var NextSunSetSplit=NextSunSet.split(":");
    var SetTodaySunsetTime=((DateTime(today.year,today.month,today.day,TodaySunSetSplit[0],TodaySunSetSplit[1],TodaySunSetSplit[2])).microsecondsSinceEpoch/1000000).round();
    var SetNextSunsetTime=((DateTime(nextDay.year,nextDay.month,nextDay.day,NextSunSetSplit[0],NextSunSetSplit[1],NextSunSetSplit[2])).microsecondsSinceEpoch/1000000).round();

    //print(Saur_calendar);
    var DateSec="${(DateTime.now().microsecondsSinceEpoch/1000000)}";
    print(DateSec);
    var year=DateTime.now().year;
    // print(year);
    // print(cmpdate);
    moon_calc=MoonCalc.phase(double.parse(DateSec));
    // print(DateSec);
    // print(moon_calc[1]);

    cday=moon_calc[1]-6;
    print(cday);
    /******Chandra Calculations *************/
    /* rashi[0]="Mesh";
          rashi[1]="Mesh";
          rashi[2]="Vrushabh";
          rashi[3]="Mithun";
          rashi[4]="Karka";
          rashi[5]="Sinha";
          rashi[6]="Kanya";
          rashi[7]="Tula";
          rashi[8]="Vrushchik";
          rashi[9]="Dhanu";
          rashi[10]="Makar";
          rashi[11]="Kumbha";
          rashi[12]="Meen";*/
    ////hour=5;
    print("HOUR$hour");
    // day=7;

    /*Moon Rashi Data Starts */
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
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
      days = "Sunday";
      //  Image im1 = Image.createImage("/SUNDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
      switch(hour)
          {
        case 0: // '\0'
          graha = "Saturn-Saving";
          break;

        case 1: // '\001'
          graha = "Jupiter-Marriage";
          break;

        case 2: // '\002'
          graha = "Mars-Debate/War";
          break;

        case 3: // '\003'
          graha = "Sun-Rajseva";
          break;

        case 4: // '\004'
          graha = "Venus-Journey";
          break;

        case 5: // '\005'
          graha = "Mercury-Learning";
          break;

        case 6: // '\006'
          graha = "Sun-Rajseva";
          break;

        case 7: // '\007'
          graha = "Venus-Journey";
          break;

        case 8: // '\b'
          graha = "Mercury-Learning";
          break;

        case 9: // '\t'
          graha = "Moon-good for everything";
          break;

        case 10: // '\n'
          graha = "Saturn-Saving";
          break;

        case 11: // '\013'
          graha = "Jupiter-Marriage";
          break;

        case 12: // '\f'
          graha = "Mars-Debate/War";
          break;

        case 13: // '\r'
          graha = "Sun-Rajseva";
          break;

        case 14: // '\016'
          graha = "Venus-Journey";
          break;

        case 15: // '\017'
          graha = "Mercury-Learning";
          break;

        case 16: // '\020'
          graha = "Moon-good for everything";
          if(snd)
          {
            // p.close();

          }
          else if(j<=29)
          {
            ///  p.close();
          }
          else if(j>=30)
          {
            // p.start();
            Rahukal="Rahu Kal [16.30-18.00 hrs]";
          }
          break;

        case 17: // '\021'
          graha = "Saturn-Saving";
          Rahukal="Rahu Kal [16.30-18.00 hrs]";
          if(snd)
          {
            // p.close();

          }
          else
          {
            //p.start();
          }
          break;

        case 18: // '\022'
          graha = "Jupiter-Marriage";
          Rahukal=" ";
          break;

        case 19: // '\023'
          graha = "Mars-Debate/War";
          break;

        case 20: // '\024'
          graha = "Sun-Rajseva";
          break;

        case 21: // '\025'
          graha = "Venus-Journey";
          break;

        case 22: // '\026'
          graha = "Mercury-Learning";
          break;

        case 23: // '\027'
          graha = "Moon-good for everything";
          break;

        case 24: // '\030'
          graha = "Saturn-Saving";
          break;
      }
    } else
    if(day == 1 && hour >= 6 || day == 2 && hour < 6)
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
      switch(hour)
          {
        case 0: // '\0'
          graha = "Sun-Rajseva";
          break;

        case 1: // '\001'
          graha = "Venus-Journey";
          break;

        case 2: // '\002'
          graha = "Mercury-Learning";
          break;

        case 3: // '\003'
          graha = "Moon-good for everything";
          break;

        case 4: // '\004'
          graha = "Saturn-Saving";
          break;

        case 5: // '\005'
          graha = "Jupiter-Marriage";
          break;

        case 6: // '\006'
          graha = "Moon-good for everything";
          break;

        case 7: // '\007'
          graha = "Saturn-Saving";
          if(snd)
          {
            //   p.close();

          }
          else if(j<=29)
          {
            //     p.close();
          }
          else if(j>=30)
          {
            //     p.start();
            Rahukal="Rahu Kal [07.30-09.00 hrs]";
          }
          break;

        case 8: // '\b'
          graha = "Jupiter-Marriage";
          Rahukal="Rahu Kal [07.30-09.00 hrs]";
          if(snd)
          {
            //   p.close();

          }
          else
          {
            //  p.start();
          }
          break;

        case 9: // '\t'
        //  p.close();
          graha = "Mars-Debate/War";
          Rahukal=" ";
          break;

        case 10: // '\n'
          graha = "Sun-Rajseva";
          break;

        case 11: // '\013'
          graha = "Venus-Journey";
          break;

        case 12: // '\f'
          graha = "Mercury-Learning";
          break;

        case 13: // '\r'
          graha = "Moon-good for everything";
          break;

        case 14: // '\016'
          graha = "Saturn-Saving";
          break;

        case 15: // '\017'
          graha = "Jupiter-Marriage";
          break;

        case 16: // '\020'
          graha = "Mars-Debate/War";
          break;

        case 17: // '\021'
          graha = "Sun-Rajseva";
          break;

        case 18: // '\022'
          graha = "Venus-Journey";
          break;

        case 19: // '\023'
          graha = "Mercury-Learning";
          break;

        case 20: // '\024'
          graha = "Moon-good for everything";
          break;

        case 21: // '\025'
          graha = "Saturn-Saving";
          break;

        case 22: // '\026'
          graha = "Jupiter-Marriage";
          break;

        case 23: // '\027'
          graha = "Mars-Debate/War";
          break;

        case 24: // '\030'
          graha = "Sun-Rajseva";
          break;
      }
    } else
    if(day == 2 && hour >= 6 || day == 3 && hour < 6)
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
      switch(hour)
          {
        case 0: // '\0'
          graha = "Moon-good for everything";
          break;

        case 1: // '\001'
          graha = "Saturn-Saving";
          break;

        case 2: // '\002'
          graha = "Jupiter-Marriage";
          break;

        case 3: // '\003'
          graha = "Mars-Debate/War";
          break;

        case 4: // '\004'
          graha = "Sun-Rajseva";
          break;

        case 5: // '\005'
          graha = "Venus-Journey";
          break;

        case 6: // '\006'
          graha = "Mars-Debate/War";
          break;

        case 7: // '\007'
          graha = "Sun-Rajseva";
          break;

        case 8: // '\b'
          graha = "Venus-Journey";
          break;

        case 9: // '\t'
          graha = "Mercury-Learning";
          break;

        case 10: // '\n'
          graha = "Moon-good for everything";
          break;

        case 11: // '\013'
          graha = "Saturn-Saving";
          break;

        case 12: // '\f'
          graha = "Jupiter-Marriage";
          break;

        case 13: // '\r'
          graha = "Mars-Debate/War";
          break;

        case 14: // '\016'
          graha = "Sun-Rajseva";
          break;

        case 15: // '\017'
          graha = "Venus-Journey";
          Rahukal="Rahu Kal [15.00-16.30 hrs]";
          if(snd)
          {
//	                         p.close();

          }
          else
          {
            //   p.start();
          }
          break;

        case 16: // '\020'
          graha = "Mercury-Learning";
          if(snd)
          {
            // p.close();
          }
          else if(j>=30)
          {
            //  p.close();
            Rahukal=" ";
          }
          else if(j<=29)
          {
            // p.start();
            Rahukal="Rahu Kal [15.00-16.30 hrs]";
          }
          break;

        case 17: // '\021'
          graha = "Moon-good for everything";
          Rahukal=" ";
          break;

        case 18: // '\022'
          graha = "Saturn-Saving";
          break;

        case 19: // '\023'
          graha = "Jupiter-Marriage";
          break;

        case 20: // '\024'
          graha = "Mars-Debate/War";
          break;

        case 21: // '\025'
          graha = "Sun-Rajseva";
          break;

        case 22: // '\026'
          graha = "Venus-Journey";
          break;

        case 23: // '\027'
          graha = "Mercury-Learning";
          break;

        case 24: // '\030'
          graha = "Moon-good for everything";
          break;
      }
    } else
    if(day == 3 && hour >= 6 || day == 4 && hour < 6)
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
      switch(hour)
          {
        case 0: // '\0'
          graha = "Mars-Debate/War";
          break;

        case 1: // '\001'
          graha = "Sun-Rajseva";
          break;

        case 2: // '\002'
          graha = "Venus-Journey";
          break;

        case 3: // '\003'
          graha = "Mercury-Learning";
          break;

        case 4: // '\004'
          graha = "Moon-good for everything";
          break;

        case 5: // '\005'
          graha = "Saturn-Saving";
          break;

        case 6: // '\006'
          graha = "Mercury-Learning";
          break;

        case 7: // '\007'
          graha = "Moon-good for everything";
          break;

        case 8: // '\b'
          graha = "Saturn-Saving";
          break;

        case 9: // '\t'
          graha = "Jupiter-Marriage";
          break;

        case 10: // '\n'
          graha = "Mars-Debate/War";
          break;

        case 11: // '\013'
          graha = "Sun-Rajseva";
          break;

        case 12: // '\f'
          graha = "Venus-Journey";
          Rahukal="Rahu Kal [12.00-13.30 hrs]";
          if(snd)
          {
            //  p.close();
          }
          else
          {
            //   p.start();
          }
          break;

        case 13: // '\r'
          graha = "Mercury-Learning";
          if(snd)
          {
            //   p.close();

          }
          else if(j>=30)
          {
            //      p.close();
            Rahukal=" ";
          }
          else if(j<=29)
          {
            //    p.start();
            Rahukal="Rahu Kal [12.00-13.30 hrs]";
          }
          break;

        case 14: // '\016'
          graha = "Moon-good for everything";
          Rahukal=" ";
          break;

        case 15: // '\017'
          graha = "Saturn-Saving";
          break;

        case 16: // '\020'
          graha = "Jupiter-Marriage";
          break;

        case 17: // '\021'
          graha = "Mars-Debate/War";
          break;

        case 18: // '\022'
          graha = "Sun-Rajseva";
          break;

        case 19: // '\023'
          graha = "Venus-Journey";
          break;

        case 20: // '\024'
          graha = "Mercury-Learning";
          break;

        case 21: // '\025'
          graha = "Moon-good for everything";
          break;

        case 22: // '\026'
          graha = "Saturn-Saving";
          break;

        case 23: // '\027'
          graha = "Jupiter-Marriage";
          break;

        case 24: // '\030'
          graha = "Mars-Debate/War";
          break;
      }
    } else
    if(day == 4 && hour >= 6 || day == 5 && hour < 6)
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
      switch(hour)
          {
        case 0: // '\0'
          graha = "Mercury-Learning";
          break;

        case 1: // '\001'
          graha = "Moon-good for everything";
          break;

        case 2: // '\002'
          graha = "Saturn-Saving";
          break;

        case 3: // '\003'
          graha = "Jupiter-Marriage";
          break;

        case 4: // '\004'
          graha = "Mars-Debate/War";
          break;

        case 5: // '\005'
          graha = "Sun-Rajseva";
          break;

        case 6: // '\006'
          graha = "Jupiter-Marriage";
          break;

        case 7: // '\007'
          graha = "Mars-Debate/War";
          break;

        case 8: // '\b'
          graha = "Sun-Rajseva";
          break;

        case 9: // '\t'
          graha = "Venus-Journey";
          break;

        case 10: // '\n'
          graha = "Mercury-Learning";
          break;

        case 11: // '\013'
          graha = "Moon-good for everything";
          break;

        case 12: // '\f'
          graha = "Saturn-Saving";
          break;

        case 13: // '\r'
          graha = "Jupiter-Marriage";
          if(snd)
          {
            //  p.close();

          }
          else if(j<=29)
          {
            //   p.close();
          }
          else if(j>=30)
          {
            // p.start();
            Rahukal="Rahu Kal [13.30-15.00 hrs]";
          }
          break;

        case 14: // '\016'
          graha = "Mars-Debate/War";
          Rahukal="Rahu Kal [13.30-15.00 hrs]";
          if(snd)
          {
            // p.close();

          }
          else
          {
            //  p.start();
          }
          break;

        case 15: // '\017'
          graha = "Sun-Rajseva";
          Rahukal=" ";
          break;

        case 16: // '\020'
          graha = "Venus-Journey";
          break;

        case 17: // '\021'
          graha = "Mercury-Learning";
          break;

        case 18: // '\022'
          graha = "Moon-good for everything";
          break;

        case 19: // '\023'
          graha = "Saturn-Saving";
          break;

        case 20: // '\024'
          graha = "Jupiter-Marriage";
          break;

        case 21: // '\025'
          graha = "Mars-Debate/War";
          break;

        case 22: // '\026'
          graha = "Sun-Rajseva";
          break;

        case 23: // '\027'
          graha = "Venus-Journey";
          break;

        case 24: // '\030'
          graha = "Mercury-Learning";
          break;
      }
    } else
    if(day == 5 && hour >= 6 || day == 6 && hour < 6)
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
      switch(hour)
          {
        case 0: // '\0'
          graha = "Jupiter-Marriage";
          break;

        case 1: // '\001'
          graha = "Mars-Debate/War";
          break;

        case 2: // '\002'
          graha = "Sun-Rajseva";
          break;

        case 3: // '\003'
          graha = "Venus-Journey";
          break;

        case 4: // '\004'
          graha = "Mercury-Learning";
          break;

        case 5: // '\005'
          graha = "Moon-good for everything";
          break;

        case 6: // '\006'
          graha = "Venus-Journey";
          break;

        case 7: // '\007'
          graha = "Mercury-Learning";
          break;

        case 8: // '\b'
          graha = "Moon-good for everything";
          break;

        case 9: // '\t'
          graha = "Saturn-Saving";
          break;

        case 10: // '\n'
          graha = "Jupiter-Marriage";

          if(snd)
          {
            //  p.close();

          }
          else if(j<=29)
          {
            // p.close();
          }
          else if(j>=30)
          {
            //  p.start();
            Rahukal="Rahu Kal [10.30-12.00 hrs]";
          }
          break;

        case 11: // '\013'
          graha = "Mars-Debate/War";
          Rahukal="Rahu Kal [10.30-12.00 hrs]";
          if(snd)
          {
            // p.close();

          }
          else
          {
            //   p.start();
          }
          break;

        case 12: // '\f'
          graha = "Sun-Rajseva";
          Rahukal=" ";
          break;

        case 13: // '\r'
          graha = "Venus-Journey";
          break;

        case 14: // '\016'
          graha = "Mercury-Learning";
          break;

        case 15: // '\017'
          graha = "Moon-good for everything";
          break;

        case 16: // '\020'
          graha = "Saturn-Saving";
          break;

        case 17: // '\021'
          graha = "Jupiter-Marriage";
          break;

        case 18: // '\022'
          graha = "Mars-Debate/War";
          break;

        case 19: // '\023'
          graha = "Sun-Rajseva";
          break;

        case 20: // '\024'
          graha = "Venus-Journey";
          break;

        case 21: // '\025'
          graha = "Mercury-Learning";
          break;

        case 22: // '\026'
          graha = "Moon-good for everything";
          break;

        case 23: // '\027'
          graha = "Saturn-Saving";
          break;

        case 24: // '\030'
          graha = "Jupiter-Marriage";
          break;
      }
    } else
    if(day == 6 && hour >= 6 || day == 7 && hour < 6)
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
      switch(hour)
          {
        case 0: // '\0'
          graha = "Venus-Journey";
          break;

        case 1: // '\001'
          graha = "Mercury-Learning";
          break;

        case 2: // '\002'
          graha = "Moon-good for everything";
          break;

        case 3: // '\003'
          graha = "Saturn-Saving";
          break;

        case 4: // '\004'
          graha = "Jupiter-Marriage";
          break;

        case 5: // '\005'
          graha = "Mars-Debate/War";
          break;

        case 6: // '\006'
          graha = "Saturn-Saving";
          break;

        case 7: // '\007'
          graha = "Jupiter-Marriage";
          break;

        case 8: // '\b'
          graha = "Mars-Debate/War";
          break;

        case 9: // '\t'
          graha = "Sun-Rajseva";
          if(snd)
          {
            //  p.close();

          }
          else if(j<=19)
          {
            //    p.close();
          }
          else if(j>=20)
          {
            Rahukal="Rahu Kal [09.20-10.40 hrs]";
            //   p.start();
          }
          break;

        case 10: // '\n'
          graha = "Venus-Journey";
          if(snd )
          {
            //  p.close();

          }
          else if(j>=40)
          {
            //  p.close();
            Rahukal=" ";
          }
          else if(j<=39)
          {
            // p.start();
            Rahukal="Rahu Kal [09.20-10.40 hrs]";
          }
          break;

        case 11: // '\013'
          graha = "Mercury-Learning";
          Rahukal=" ";
          break;

        case 12: // '\f'
          graha = "Moon-good for everything";
          break;

        case 13: // '\r'
          graha = "Saturn-Saving";
          break;

        case 14: // '\016'
          graha = "Jupiter-Marriage";
          break;

        case 15: // '\017'
          graha = "Mars-Debate/War";
          break;

        case 16: // '\020'
          graha = "Sun-Rajseva";
          break;

        case 17: // '\021'
          graha = "Venus-Journey";
          break;

        case 18: // '\022'
          graha = "Mercury-Learning";
          break;

        case 19: // '\023'
          graha = "Moon-good for everything";
          break;

        case 20: // '\024'
          graha = "Saturn-Saving";
          break;

        case 21: // '\025'
          graha = "Jupiter-Marriage";
          break;

        case 22: // '\026'
          graha = "Mars-Debate/War";
          break;

        case 23: // '\027'
          graha = "Sun-Rajseva";
          break;

        case 24: // '\030'
          graha = "Venus-Journey";
          break;
      }
    } else

    {
      // Image im1 = Image.createImage("/SATURDAY_htc.png");
      //g.drawImage(im1, -225, -225, 0);
    }

    List<String> return_value=[CRashi,CNkh,graha,Rahukal,days,"$cday"];
    print(return_value);
    return return_value;

  }
}
