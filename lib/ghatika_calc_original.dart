
class ghatika_calc_orginal
{
  var prahar;
  var ghtdata;
  var paldata;
  var vipaldata;
  var pal_k=0;
  var ghatika_act=0.00;
  var ghatika_z=0;
  var hours_m=0;
  var pal_act=0.00;
  var vipal=0.00;



// try {


var hours ;
var minutes ;
var sec ;
var miliSec;
var curTime;
  var DefaultValue=6;
//Log.v("log_tag", "Log is here Time is now" + curTime);
//   firstrun();
  List<String> getGhatikaPaldata(String SunRise,String SunSet,String  NextSunRise,
      String NextSunSet,String PrevSunRise,String PrevSunSet) {
    print("SunRise$SunRise,$SunSet");
    var  today=DateTime.now();
   // var today= DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,int.parse("06"),int.parse("30"),int.parse("00"));
    var nextDay=DateTime.now().add(Duration(days: 1));
    var prevDay=DateTime.now().subtract(Duration(days: 1));

    var TodaySunRiseSplit=SunRise.split(":");
    var NextSunRiseSplit=NextSunRise.split(":");
    var PrevSunRiseSplit=PrevSunRise.split(":");

    var CurrentDate=today;
    var CurrentTime=(DateTime.now().microsecondsSinceEpoch/1000000).round();
    print("CurrentTime${(DateTime.now().microsecondsSinceEpoch/1000000).round()}");
     //CurrentTime= ((DateTime(today.year,today.month,today.day,int.parse("04"),int.parse("10"),int.parse("00"))).microsecondsSinceEpoch/1000000).round();
    print("CurrentTime$CurrentTime");
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

    if(CurrentTime >= SetTodaySunriseTime ) {
      print("ghatikaherinif");
      print("CurrentTime$CurrentTime,$SetTodaySunriseTime,$SetTodaySunsetTime");
      if(CurrentTime >= SetTodaySunsetTime)
      {
        print("ghatikaherinifelseif");
        var NightTime = SetNextSunriseDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeNow = CurrentDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeEqual = NightTime / 30;
        var PaltimeEqual= NightTime/1800;
        var dayNight="night";
        var equalNightTime=NighttimeEqual;
        var CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
        var calc=(CurrentTimeDayhora*NighttimeEqual).floor();

        print("ghatikaCalc$NighttimeEqual");
        print("ghatikaCalc$CurrentTimeDayhora");
        pal_k=((NighttimeNow / PaltimeEqual)%60).floor();
        ghatika_z=CurrentTimeDayhora+30;
        print("ghatikaCalc$ghatika_z");
      }
      else
        {
          print("ghatikaherinifelse");
          var Daytime = SetTodaySunsetDate
              .difference(SetTodaySunriseDate)
              .inMinutes;


          var DaytimeNow = CurrentDate
              .difference(SetTodaySunriseDate)
              .inMinutes;
          var DaytimeEqual = Daytime / 30;
          var PaltimeEqual= Daytime/1800;
          var dayNight="day";
          var equalTime=DaytimeEqual;
          var CurrentTimeDayhora = (DaytimeNow / DaytimeEqual).floor();
          // CurrentTimeDayhora=(CurrentTimeDayhora/60).floor();
          var calc=(CurrentTimeDayhora*DaytimeEqual).floor();
          var pal_calc=((DaytimeNow / DaytimeEqual))-CurrentTimeDayhora;
          print("ghatikaCalc$DaytimeEqual");
          print("ghatikaCalc${(DaytimeNow / DaytimeEqual)}");
          print("ghatikaCalc$CurrentTimeDayhora");
          print("ghatikaCalc${pal_calc}");
          print("ghatikaCalc${pal_calc*60}");
          print("ghatikaCalc${(DaytimeNow / PaltimeEqual)%60}");
          pal_k=((DaytimeNow / PaltimeEqual)%60).floor();
          ghatika_z=CurrentTimeDayhora;
        }

    }
    else if(CurrentTime < SetTodaySunriseTime)
    {
      var NightTime = SetTodaySunriseDate
          .difference(SetPrevSunsetDate)
          .inMinutes;
      var NighttimeNow = CurrentDate
          .difference(SetPrevSunsetDate)
          .inMinutes;
      var NighttimeEqual = NightTime / 30;
      var PaltimeEqual= NightTime/1800;
      var dayNight="night";
      var equalNightTime=NighttimeEqual;
      var CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
      var calc=(CurrentTimeDayhora*NighttimeEqual).floor();
      print("ghatikaherinelseif");
      pal_k=((NighttimeNow / PaltimeEqual)%60).floor();
      ghatika_z=CurrentTimeDayhora+30;
    }
    else
      {
        print("ghatikaherinelse");
      }



    hours = DateTime.now().hour;
     minutes = DateTime.now().minute;
     sec = DateTime.now().second;
     miliSec=DateTime.now().millisecond;
     curTime = "$hours  :  $minutes :: $sec";

     var k=DateTime.now().second;
     var m=DateTime.now().hour;
     print("DefaultValue$DefaultValue");
    DefaultValue=int.parse(TodaySunRiseSplit[0]);
    print("DefaultValue$DefaultValue");
     // if(m==DefaultValue)
     // {
     //   ghatika_z=0;
     // }
     // else
     // {
     //   ghatika_z=(m-DefaultValue);
     //   ghatika_z=ghatika_z+((ghatika_z*90)/60);
     // }
  //   pal_k =minutes;
//m=0;
    print("ghatikaCalc${ghatika_z}");
    ghatika_act=ghatika_z*6+(pal_k*0.25);
    print("ghatikaCalc${ghatika_act}");
/******************************/
     vipal = sec*2.5;

//System.out.println("VIPAL"+ vipal);
    vipal=vipal+1;
// trace(sec);
    if(vipal>=140)
    {
      vipal=0;
    }
//trace(sec);
// trace(k);
    if((vipal)==0)
    {
      pal_k=pal_k+1;

      ghatika_act=ghatika_act+0.25;
//System.out.println("jjjjjjjjjj"+pal_k);
    }

    if(pal_k>=60)
    {
      pal_k=0;
      ghatika_z=ghatika_z+1;
    }
    if(pal_k==0&&sec<=2.5)
    {
//ghatika_z=ghatika_z+1;
//ghatika=ghatika_z*6+(k*0.25);
//System.out.println("jjjjjjjjjj"+ghatika_z);

    }
//m=d.getHours()
//     if(hours_m==DefaultValue)
//     {
//       ghatika_z=0;
//     }
     pal_act = pal_k*6;

    writeData(ghatika_act,pal_act,vipal);

    List<String> return_value=[prahar,ghtdata.toString(),paldata.toString(),vipaldata.toString(),
      ghatika_act.toString(),pal_act.toString(),vipal.toString()];
    print("GhatikaDATA: $return_value");
    return return_value;
  }

// RotateAnimation rotateAnimation = new RotateAnimation(
// Float.parseFloat(Double.toString(vipal)), Float.parseFloat(Double.toString(vipal)),
// Animation.RELATIVE_TO_SELF, 0.5f,
// Animation.RELATIVE_TO_SELF, 0.5f);
//
// rotateAnimation.setInterpolator(new LinearInterpolator());
// rotateAnimation.setDuration(250);
// rotateAnimation.setFillAfter(true);
//
// RotateAnimation rotateAnimationPal = new RotateAnimation(
// Float.parseFloat(Double.toString(pal_act)), Float.parseFloat(Double.toString(pal_act)),
// Animation.RELATIVE_TO_SELF, 0.5f,
// Animation.RELATIVE_TO_SELF, 0.5f);
//
// rotateAnimationPal.setInterpolator(new LinearInterpolator());
// rotateAnimationPal.setDuration(250);
// rotateAnimationPal.setFillAfter(true);
//
// RotateAnimation rotateAnimationSolar = new RotateAnimation(
// Float.parseFloat(Double.toString(ghatika_act)), Float.parseFloat(Double.toString(ghatika_act)),
// Animation.RELATIVE_TO_SELF, 0.5f,
// Animation.RELATIVE_TO_SELF, 0.5f);
//
// rotateAnimationSolar.setInterpolator(new LinearInterpolator());
// rotateAnimationSolar.setDuration(250);
// rotateAnimationSolar.setFillAfter(true);
//
// img.startAnimation(rotateAnimation);
// img_ghatika.startAnimation(rotateAnimationSolar);
// img_pal.startAnimation(rotateAnimationPal);
// } catch (Exception e) {
//
// }
// Calendar calendar = Calendar.getInstance();
// hour = calendar.get(11);
// int j = calendar.get(12);
// int k = calendar.get(10);
// int i = calendar.get(13);
// day = calendar.get(7);
// //  int today = calendar.get(5);
// //  int month = calendar.get(2);
// //  int year = calendar.get(1);
// ///  int mth = calendar.get(2);
// //  int cmpTo = 0;
// //  int cmpdate = calendar.get(5);
// sec=calendar.get(12);
//
// vipal = sec*2.5;
//
// //System.out.println("VIPAL"+ vipal);
// sec=sec+1;
// // trace(sec);
// if(sec>=140)
// {
// sec=0;
// }
// //trace(sec);
// // trace(k);
// if((sec)==0)
// {
// pal_k=pal_k+1;
//
// ghatika_act=ghatika_act+0.25;
// //System.out.println("jjjjjjjjjj"+pal_k);
// }
//
// if(pal_k>=60)
// {
// pal_k=0;
// ghatika_z=ghatika_z+1;
// }
// if(pal_k==0&&sec<=2.5)
// {
// //ghatika_z=ghatika_z+1;
// //ghatika=ghatika_z*6+(k*0.25);
// //System.out.println("jjjjjjjjjj"+ghatika_z);
//
// }
// //m=d.getHours()
// if(hours_m==6)
// {
// ghatika_z=0;
// }
// pal_act = pal_k*6;
//
// //
// // String s;
// // if(Integer.toString(hour).length() == 1)
// // s = "0" + Integer.toString(hour);
// // else
// // s = Integer.toString(hour);
// // String s1;
// // if(Integer.toString(j).length() == 1)
// // s1 = "0" + Integer.toString(j);
// // else
// // s1 = Integer.toString(j);
// // String s2;
// // if(Integer.toString(i).length() == 1)
// // s2 = "0" + Integer.toString(i);
// // else
// // s2 = Integer.toString(i);
// //
// // try
// // {
// // //Image im1 = Image.createImage("/day.png");
// // // g.drawImage(im1, -225, -199, 0);
// //
// // }
// // catch(Exception e) { }
// //
// // for(int k1 = 0; k1 < 12; k1++)
// // {
// // byte byte0;
// // if(k1 % 3 == 0)
// // byte0 = 6;
// // else
// // byte0 = 2;
// // }
//
//
// writeData(ghatika_act,pal_act,vipal);
// //prahar="5";
// try
// {
// if(Integer.parseInt(prahar)>4)
// {
// //Image im2 = Image.createImage("/moon.png");
// // g.drawImage(im2, 8, i1+37, 20);
// //  g.drawString("Night:" ,40, i1+42, 20);
// }
// else
// {
// // Image im1 = Image.createImage("/day.png");
// //  g.drawImage(im1, 8, i1+37, 20);
// // g.drawString("Day:" ,40, i1+42, 20);
// }
//
// }
// catch(Exception e)
// {
//
// }
//
//
// //  g.drawString("Prahar:- "+ prahar ,40, i1+72, 20);
// //  g.drawString("Ghatika- "+ ghtdata,40, i1+102, 20);
// //  g.drawString("Pal- "+ paldata, 40, i1+132, 20);
// //  g.drawString("Vipal- "+ vipaldata, 40, i1+162, 20);
// //  g.drawString(copy+"Auspi Watch", j1 + 40, (i1+202), 20);
// // String Displaystr ="";
// // Displaystr=Displaystr+"Prahar:- "+ prahar+"\n";
// // Displaystr=Displaystr+"Ghatika:- "+ ghtdata+"\n";
// // Displaystr=Displaystr+"Pal:- "+ paldata+"\n";
// // Displaystr=Displaystr+"Vipal:- "+ vipaldata+"\n";
//
// sourcal.setText(Displaystr);
//
// //Displaystr=IMONTHS[imth] + " " + Integer.toString(idate) + ","+"Shak Samvat " + Integer.toString(iyr)+"\n";
// // Displaystr=Displaystr+"" + IDAYS[iday - 1]+" "+ s + ":" + s1 + ":" + s2 + "  \n";
// // Displaystr=Displaystr+"\nSUN"+" - "+"RASHI:- "+ras+"\nNAKSHATRA:- "+naksh+"\n"+"RUTU:- "+rutu+"\n"+sun+"\n";
//
// }








 void firstrun()
{/*
  // Calendar d= Calendar.getInstance();
  // int k=d.get(12);
  // sec=d.get(13)*6;
  // int m=d.get(11);
  var k=DateTime.now().second;
  var m=DateTime.now().hour;

  if(m==DefaultValue)
  {
    ghatika_z=0;
  }
  else
  {
    ghatika_z=(m-DefaultValue);
    ghatika_z=ghatika_z+((ghatika_z*90)/60);
  }
  pal_k =k;
//m=0;
  ghatika_act=ghatika_z*6+(k*0.25);
//  System.out.println(ghatika_act+"----------"+pal_k);
// pal_k=58;
*/
}
void  writeData(var g_rot,var p_rot,var v_rot)
{
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

  if(g_rot<0)
  {
    g_rot=g_rot*(-1);
    ghtdata=(60-(g_rot/6).floor());
  }else
  {
    ghtdata=(g_rot/6).floor();
  }
  if(p_rot<0)
  {
    p_rot=p_rot*(-1);
    paldata=(60-(p_rot/6).floor());
  }else
  {
    paldata=(p_rot/6).floor();
  }
  if(v_rot<0)
  {
    v_rot=v_rot*(-1);
    vipaldata=(60-(v_rot/6).floor());
  }else
  {
    vipaldata=(v_rot/6).ceil();
  }
// System.out.println("Prahar- "+ prahar+", Ghatika- "+ ghtdata+"\n"+"Pal- "+ paldata+", Vipal- "+ vipaldata);
// updata="Prahar- "+ prahar+", Ghatika- "+ ghtdata;
// dwdata="Pal- "+ paldata+", Vipal- "+ vipaldata;
}
}