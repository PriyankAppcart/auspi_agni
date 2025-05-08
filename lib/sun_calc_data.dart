

class sun_calc_data
{


  List<String> getSundata(Solar_deg_new) {
    String sun = "";
    String rutu = "";
    String ras = "";
    String naksh = "";
    String Solar_deg="";

    int cmpTo = 0;

    List IDAYS =  ["Raviwar","Somwar","Mangalwar","Budhwar","Guruwar",  "Shukrawar","Shanivar"];
    // List IDAYS =  ["रविवार", "सोमवार", "मंगळवार", "बुधवार", "गुरुवार", "शुक्रवार", "शनिवार"];
    var MDAYS =  [30,31,31,31,31,31,30,30,30,30,30,30,31];
    List IMONTHS =  ["Chaitra","Vaishakh","Jyeshtha","Aashadh","Shravan",  "Bhadrapad","Ashvin","Kartik","Margashirsh","Paush","Magh","Falgun"];
    //  List IMONTHS =  ["चैत्र", "वैशाख", "ज्येष्ठ", "आषाढ", "श्रावण", "भाद्रपद", "आश्विन", "कार्तिक", "मार्गशीर्ष", "पौष", "माघ", "फाल्गुन"];
    //int MDAYS[] = new int[13];
    // String IMONTHS[] = new String[12];
    var iday;
    // var calendar = DateTime(2025,12,21,7,52,0);
    var calendar = DateTime.now();
    int mth = calendar.month-1;
    int cmpdate = calendar.day;
    var day=calendar.weekday;
    var hour=calendar.hour;
    var year=calendar.year;
    var today =calendar.day;
    var month= calendar.month;
    // int mth = DateTime.now().month-1;
    // int cmpdate = DateTime.now().day;
    // var day=DateTime.now().weekday;
    // var hour=DateTime.now().hour;
    // var year=DateTime.now().year;
    // var today =DateTime.now().day;
    // var month= DateTime.now().month;
    // var calendar = DateTime.now();
    var setyear=2023;
    var solar;
    // print("hi in sun$mth");
    switch (mth) {
      case 0:
      case 3:
        cmpTo = 21;
        break;

      case 1: // '\001'
        cmpTo = 20;
        break;

      case 2:
        if (year % 4 == 0)
          cmpTo = 21;
        else
          cmpTo = 22;
        // print("Hi CMPto$cmpTo");
        break;

      case 4:
        cmpTo = 22;
        print("Hi CMPto$cmpTo");
        break; // '\004'
      case 5:
        cmpTo = 22;
        break; // '\005'
      case 10: // '\n'
      case 11:
        cmpTo = 22;
        break;

      case 6: // '\006'
      case 7: // '\007'
      case 8: // '\b'
      case 9:
        cmpTo = 23;
        break;
      default:
        break;
    }

    // print("hi in sun$cmpTo");
    var idate = (calendar.day - cmpTo) + 1;
    // print("hi in sun$idate");
    var imth;
    if (cmpdate >= cmpTo)
      imth = (mth) - 2;
    else
      imth = (mth) - 3;
    if (imth < 0)
      imth += 12;
    if (imth == 0) {
      if (year % 4 == 0) {
        if (idate <= 0)
          idate += 31;
      } else if (idate <= 0)
        idate += 30;
    } else if (imth > 5) {
      if (idate <= 0)
        idate += 30;
    } else if (idate <= 0)
      idate += 31;
    if (hour < 6 && --idate <= 0) {
      if (--imth < 0)
        imth += 12;
      if (year % 4 == 0) {
        if (imth == 0)
          idate += MDAYS[12];
      } else {
        idate += MDAYS[imth];
      }
    }
    // print("hi in sun$idate--$imth");

    var iyr = year - 78;

    if (year % 4 == 0) {
      // print("hi in sun$idate--$imth--$iyr");
      DateTime cal1 = DateTime(year, 3, 21, 6);
      //  print("hi in sun$idate--$imth--$iyr");
      /*Calendar.getInstance();
  cal1.set(1, year);
  cal1.set(2, 2);
  cal1.set(5, 21);
  cal1.set(11, 6);
*/

      //("if " + cal1.month.toString());
      //("if " + cal1.getTime());
      if (cal1.compareTo(calendar) > 0) {
        //  print("DT1 is before DT2");
        iyr--;
      }
    }
    else {
      print(" not leap in sun$idate--$imth--$iyr");
      DateTime cal2 = DateTime(year, 3, 22, 6);
      if (cal2.compareTo(calendar) > 0) {
        //       System.out.println("else " + cal2.get(5));
        print("hi in sun$idate--$imth--$iyr");
        iyr--;
      }
      print(" not leap in sun$idate--$imth--$iyr");
    }
    //print("hi in sun$idate--$imth--$iyr");
    /*
  if(cal1.after(calendar))
  iyr--;
  } else
  {
    DateTime cal2 = DateTime(year,2,22,6);
  /*Calendar.getInstance();
  cal2.set(1, year);
  cal2.set(2, 2);
  cal2.set(5, 22);
  cal2.set(11, 6);
  */

  if(cal2.after(calendar))
  {
  System.out.println("else " + cal2.get(5));
  iyr--;
  }

*/
    iday = calendar.weekday;
    if (iday - 1 == 0) {
      if (setyear != 0) {
        ////.setBackgroundResource(R.drawable.sunday);
      }
      else {
        //Relclock.setBackgroundColor(0X99ffffff);
        //myClock.setBackgroundResource(R.drawable.sunday);
      }
    }
    else if (iday - 1 == 1) {
      if (setyear != 0) {
        //Relclock.setBackgroundResource(R.drawable.monday);
      }
      else {
        // Relclock.setBackgroundColor(0X99ffffff);
        // myClock.setBackgroundResource(R.drawable.monday);
      }
    }
    else if (iday - 1 == 2) {
      if (setyear != 0) {
        // Relclock.setBackgroundResource(R.drawable.tuesday);
      }
      else {
        // Relclock.setBackgroundColor(0X99ffffff);
        // myClock.setBackgroundResource(R.drawable.tuesday);
      }
    }
    else if (iday - 1 == 3) {
      if (setyear != 0) {
        // Relclock.setBackgroundResource(R.drawable.wednesday);
      }
      else {
        // Relclock.setBackgroundColor(0X99ffffff);
        // myClock.setBackgroundResource(R.drawable.wednesday);
      }
    }
    else if (iday - 1 == 4) {
      if (setyear != 0) {
        //Relclock.setBackgroundResource(R.drawable.thursday);
      }
      else {
        //Relclock.setBackgroundColor(0X99ffffff);
        //myClock.setBackgroundResource(R.drawable.thursday);
      }
    }
    else if (iday - 1 == 5) {
      if (setyear != 0) {
        //Relclock.setBackgroundResource(R.drawable.friday);
      }
      else {
        //Relclock.setBackgroundColor(0X99ffffff);
        //myClock.setBackgroundResource(R.drawable.friday);
      }
    }
    else if (iday - 1 == 6) {
      if (setyear != 0) {
        //Relclock.setBackgroundResource(R.drawable.saturday);
      }
      else {
        //Relclock.setBackgroundColor(0X99ffffff);
        //myClock.setBackgroundResource(R.drawable.saturday);
      }
    }


    if (calendar.hour < 6)
      iday--;
    if (iday < 0)
      iday += 7;
    int leap;
    if (year % 4 == 0)
      leap = 1;
    else
      leap = 0;

    switch (month) {
      case 2: // '\001'
        today = 31 + today + leap;
        break;

      case 3: // '\002'
        today = 59 + today + leap;
        break;

      case 4: // '\003'
        today = 90 + today + leap;
        break;

      case 5: // '\004'
        today = 120 + today + leap;
        break;

      case 6: // '\005'
        today = 151 + today + leap;
        break;

      case 7: // '\006'
        today = 181 + today + leap;
        break;

      case 8: // '\007'
        today = 212 + today + leap;
        break;

      case 9: // '\b'
        today = 242 + today + leap;
        break;

      case 10: // '\t'
        today = 273 + today + leap;
        break;

      case 11: // '\n'
        today = 303 + today + leap;
        break;

      case 12: // '\013'
        today = 334 + today + leap;
        break;
    }
    var fday = today - 14;
    solar = 270 + fday;

    // solar=150;
//solar=252;
    if (solar >= 360.00)
      solar -= 360.00;
    //print("Solar value$solar");
    //  System.out.println(solar);
    print("INSOLAR  $solar");
    solar=Solar_deg_new;
    print("INSOLAR  $solar");
    if (solar > 252 && (solar <= 360 || solar == 0)) {
      sun = "UTTARAYAN";
      // sun = "उत्तरायण";
    }
    else if (solar >= 0 && solar <= 68) {
      sun = "UTTARAYAN";
      // sun = "उत्तरायण";
    }
    else if (solar > 68 && solar <= 252) {
      sun = "DAKSHINAYAN";
      // sun = "दक्षिणायन";
    }

    if (solar > 233 && solar <= 293) {
      rutu = "Shishir";
      // rutu = "शिशिर";

    }
    else if (solar > 293 && solar <= 353) {
      rutu = "Vasant";
      // rutu = "वसंत";
    }
    else if (solar > 353 && solar <= 360) {
      rutu = "Grishma";
      // rutu = "ग्रीष्म";
    }
    else if (solar >= 0 && solar <= 53) {
      rutu = "Grishma";
      // rutu = "ग्रीष्म";
    }
    else if (solar > 53 && solar <= 113) {
      rutu = "Varsha";
      // rutu = "वर्षा";
    }
    else if (solar > 113 && solar <= 173) {
      rutu = "Sharad";
      // rutu = "शरद";
    }
    else if (solar > 173 && solar <= 233) {
      rutu = "Hemant";
      // rutu = "हेमंत";
    }
/*
    if (solar >= 240 && solar <= 300) {
      rutu = "Shishir";
    }
    else if (solar >= 300 && solar <= 360) {
      rutu = "Vasant";
    }
    else if (solar >= 0 && solar <= 60) {
      rutu = "Grishma";
    }
    else if (solar >= 60 && solar <= 120) {
      rutu = "Varsha";
    }
    else if (solar >= 120 && solar <= 180) {
      rutu = "Sharad";
    }
    else if (solar >= 180 && solar <= 240) {
      rutu = "Hemant";
    }
    */
    if (solar >= 0 && solar <= 30) {
      ras = "Mesh";
      // ras = "मेष";
    }
    else if (solar > 30 && solar <= 60) {
      ras = "VruShabh";
      // ras = "वृषभ";
    }
    else if (solar > 60 && solar <= 90) {
      ras = "Mithun";
      // ras = "मिथुन";
    }
    else if (solar > 90 && solar <= 120) {
      ras = "Karka";
      // ras = "कर्क";
    }
    else if (solar > 120 && solar <= 150) {
      ras = "Sinmha";
      // ras = "सिंह";
    }
    else if (solar > 150 && solar <= 180) {
      ras = "Kanya";
      // ras = "कन्या";
    }
    else if (solar > 180 && solar <= 210) {
      ras = "Tula";
      // ras = "तुळ";
    }
    else if (solar > 210 && solar <= 240) {
      ras = "Vrushchik";
      // ras = "वृश्चिक";
    }
    else if (solar > 240 && solar <= 270) {
      ras = "Dhanu";
      // ras = "धनू";
    }
    else if (solar > 270 && solar <= 300) {
      ras = "Makar";
      // ras = "मकर";
    }
    else if (solar > 300 && solar <= 330) {
      ras = "Kumbha";
      // ras = "कुंभ";
    }
    else if (solar > 330 && solar <= 360) {
      ras = "Meen";
      // ras = "मीन";
    }

    if (solar >= 0 && solar <= 13) {
      naksh = "Ashwini";
      // naksh = "अश्विनी";
    }
    else if (solar > 13 && solar <= 26) {
      naksh = "Bharani";
      // naksh = "भरणी";
    }
    else if (solar > 26 && solar <= 40) {
      naksh = "Krutika";
      // naksh = "कृत्तिका";
    }
    else if (solar > 40 && solar <= 53) {
      naksh = "Rohini";
      // naksh = "रोहिणी";
    }
    else if (solar > 53 && solar <= 66) {
      naksh = "Mruga";
      // naksh = "मृग";
    }
    else if (solar > 66 && solar <= 80) {
      naksh = "Ardra";
      // naksh = "आर्द्रा";
    }
    else if (solar > 80 && solar <= 93) {
      naksh = "Punarvasu";
      // naksh = "पुनर्वसू";
    }
    else if (solar > 93 && solar <= 106) {
      naksh = "Pushya";
      // naksh = "पुष्य";
    }
    else if (solar > 106 && solar <= 120) {
      naksh = "Ashlesha";
      // naksh = "आश्लेषा";
    }
    else if (solar > 120 && solar <= 133) {
      naksh = "Magha";
      // naksh = "मघा";
    }
    else if (solar > 133 && solar <= 146) {
      naksh = "Purva Falgun";
      // naksh = "पूर्वा फाल्गुनी";
    }
    else if (solar > 146 && solar <= 160) {
      naksh = "Uttara Falgun";
      // naksh = "उत्तरा फाल्गुनी";
    }
    else if (solar > 160 && solar <= 173) {
      naksh = "Hasta";
      // naksh = "हस्त";
    }
    else if (solar > 173 && solar <= 186) {
      naksh = "Chitra";
      // naksh = "चित्रा";
    }
    else if (solar > 186 && solar <= 200) {
      naksh = "Swati";
      // naksh = "स्वाती";
    }
    else if (solar > 200 && solar <= 213) {
      naksh = "Vishakha";
      // naksh = "विशाखा";
    }
    else if (solar > 213 && solar <= 226) {
      naksh = "Anuradha";
      // naksh = "अनुराधा";
    }
    else if (solar > 226 && solar <= 240) {
      naksh = "Jyeshtha";
      // naksh = "ज्येष्ठा";
    }
    else if (solar > 240 && solar <= 253) {
      naksh = "Mula";
      // naksh = "मूळ";
    }
    else if (solar > 253 && solar <= 266) {
      naksh = "Poorvashadha";
      // naksh = "पूर्वाषाढा";
    }
    else if (solar > 266 && solar <= 280) {
      naksh = "UttaraShadha";
      // naksh = "उत्तराषाढा";
    }
    else if (solar > 280 && solar <= 293) {
      naksh = "Shravan";
      // naksh = "श्रवण";
    }
    else if (solar > 293 && solar <= 306) {
      naksh = "Dhanishtha";
      // naksh = "धनिष्ठा";
    }
    else if (solar > 306 && solar <= 320) {
      naksh = "Shatataraka";
      // naksh = "शततारका";
    }
    else if (solar > 320 && solar <= 333) {
      naksh = "PoorvaBhadrapada";
      // naksh = "पूर्वाभाद्रपदा";
    }
    else if (solar > 333 && solar <= 346) {
      naksh = "UttaraBhadrapada";
      // naksh = "उत्तराभाद्रपदा";
    }
    else if (solar > 346 && solar <= 360) {
      naksh = "Revati";
      // naksh = "रेवती";
    }

    // print(sun);
    // print(ras);
    // print(rutu);
    // print(naksh);
    Solar_deg="$solar";
    var Saur_calendar=IMONTHS[imth] + " $idate , Shak Samvat $iyr";
    List<String> return_value=[ras,naksh,rutu,sun,Saur_calendar,Solar_deg];
    // var Saur_calendar=IMONTHS[imth] + " $idate , शक संवत $iyr";
    // List<String> return_value=[ras,naksh,rutu,sun,Saur_calendar,Solar_deg];
    // print(Saur_calendar);
    return return_value;

/*

String Displaystr ="";

Displaystr=IMONTHS[imth] + " " + Integer.toString(idate) + ","+"Shak Samvat " + Integer.toString(iyr)+"\n";
Displaystr=Displaystr+"" + IDAYS[iday - 1]+" "+ s + ":" + s1 + ":" + s2 + "  \n";
Displaystr=Displaystr+"SUN"+" - "+"RASHI:- "+ras+"\nNAKSHATRA:- "+naksh+"\n"+"RUTU:- "+rutu+"\n"+sun;
  String s,s1,s2;

  if(Integer.toString(hour).length() == 1)
  s = "0" + Integer.toString(hour);
  else
  s = Integer.toString(hour);

if(Integer.toString(j).length() == 1)
  s1 = "0" + Integer.toString(j);
else
s1 = Integer.toString(j);

if(Integer.toString(i).length() == 1)
s2 = "0" + Integer.toString(i);
else
s2 = Integer.toString(i);*/
  }
}
