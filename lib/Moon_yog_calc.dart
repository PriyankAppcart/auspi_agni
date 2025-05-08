class moon_yog_calc
{
  List rashi = ["Mesh","Mesh","Vrushabh","Mithun","Karka",
    "Sinha","Kanya","Tula","Vrushchik","Dhanu","Makar","Kumbha","Meen"];

  List yog = ["Anand","Kaal","Dhoomra","Prajap","Saumya",
    "Dhvanksha","Dhwaj","Shreevatsa","Vajra","Mudgar","Chatra","Mitra","Manas"
    ,"Padma","Lumbak","Utpaat","Mrutyu","Kon","Siddhi","Shubha","Amrut","Musal","Gada","Matang"
    ,"Rakshas","Char","Sthir","Vruddhi"];

  List fal = ["Siddhi","Mrutyu","Asukha","Saubhagya","Dhanakshay",
    "Sukha","Kshay","Shreenash","Rajyog","Pushti","Dhanalabh","Dhananash","Prananash"
    ,"Klesh","Karyasiddhi","Kalyan","Kulavruddhi","Mahakashta","Gruharambha","Vivah"];

  List<String> getYogData(double cday,SunRise,SunSet,NextSunRise,NextSunSet)
{
  var CRashi;
  var Yog_str="";
  var Fal_str="";
  var day=DateTime.now().weekday;
  var hour=DateTime.now().hour;
  var CNkh="";
 var yogbad=true;
 var yoggood=false;
  if(cday<=0)
  {
    cday=360+cday;

  }

  if(cday<=(9.0*1.0*360.0/108.0))
  {
    CRashi=rashi[1];
  }

  else if(cday<=(9.0*2.0*360.0/108.0))
  {
    CRashi=rashi[2];
  }

  else if(cday<=(9.0*3.0*360.0/108.0))
  {
    CRashi=rashi[3];
    // System.out.println("fdsdsdfdsfsdfsdfsd"+(9*2*360)/108);
  }

  else if(cday<=(9.0*4.0*360.0/108.0))
  {
    CRashi=rashi[4];
  }

  else if(cday<=(9.0*5.0*360.0/108.0))
  {
    CRashi=rashi[5];
  }

  else if(cday<=(9.0*6.0*360.0/108.0))
  {
    CRashi=rashi[6];
  }

  else if(cday<=(9.0*7.0*360.0/108.0))
  {
    CRashi=rashi[7];
  }

  else if(cday<=(9.0*8.0*360.0/108.0))
  {
    CRashi=rashi[8];
  }

  else if(cday<=(9.0*9.0*360.0/108.0))
  {
    CRashi=rashi[9];
  }

  else if(cday<=(9.0*10.0*360.0/108.0))
  {
    CRashi=rashi[10];
  }

  else if(cday<=(9.0*11.0*360.0/108.0))
  {
    CRashi=rashi[11];
  }

  else if(cday<=(9.0*12.0*360.0/108.0))
  {
    CRashi=rashi[12];
  }

  if(cday<=0)
  {
    cday=360+cday;

  }

  if(cday<=(4.0*1.0*360.0/108.0))
  {
    CNkh="Ashwini";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
  }
  else if(cday<=(4.0*2.0*360.0/108.0))
  {
    CNkh="Bharani";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
  }
  else if(cday<=(4.0*3.0*360.0/108.0))
  {
    CNkh="Krutika";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[14];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[11];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
  }
  else if(cday<=(4.0*4.0*360.0/108.0))
  {
    CNkh="Rohini";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
  }
  else if(cday<=(4.0*5.0*360.0/108.0))
  {
    CNkh="Mruga";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
  }
  else if(cday<=(4.0*6.0*360.0/108.0))
  {
    CNkh="Ardra";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[1];
      Fal_str=fal[1];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
  }
  else if(cday<=(4.0*7.0*360.0/108.0))
  {
    CNkh="Punarvasu";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[14];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[11];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
  }
  else if(cday<=(4.0*8.0*360.0/108.0))
  {
    CNkh="Pushya";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
  }
  else if(cday<=(4.0*9.0*360.0/108.0))
  {
    CNkh="Ashlesha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
  }
  else if(cday<=(4.0*10.0*360.0/108.0))
  {
    CNkh="Magha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[1];
      Fal_str=fal[1];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
  }
  else if(cday<=(4.0*11.0*360.0/108.0))
  {
    CNkh="Purva Falgun";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[14];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[11];
    }
  }
  else if(cday<=(4.0*12.0*360.0/108.0))
  {
    CNkh="Uttara Falgun";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
  }
  else if(cday<=(4.0*13.0*360.0/108.0))
  {
    CNkh="Hasta";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
  }
  else if(cday<=(4.0*14.0*360.0/108.0))
  {
    CNkh="Chitra";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[1];
      Fal_str=fal[1];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
  }
  else if(cday<=(4.0*15.0*360.0/108.0))
  {
    CNkh="Swati";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[11];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[14];
    }
  }
  else if(cday<=(4.0*16.0*360.0/108.0))
  {
    CNkh="Vishakha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
  }
  else if(cday<=(4.0*17.0*360.0/108.0))
  {
    CNkh="Anuradha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
  }
  else if(cday<=(4.0*18.0*360.0/108.0))
  {
    CNkh="Jyeshtha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[1];
      Fal_str=fal[1];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
  }
  else if(cday<=(4.0*19.0*360.0/108.0))
  {
    CNkh="Mula";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[0];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[11];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
  }
  else if(cday<=(4.0*20.0*360.0/108.0))
  {
    CNkh="Poorvashadha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
  }
  else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
  {
    CNkh="UttaraShadha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
  }
  else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
  {
    CNkh="Abijat";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[1];
      Fal_str=fal[1];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
  }
  else if(cday<=(4.0*22.0*360.0/108.0))
  {
    CNkh="Shravan";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[14];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[11];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
  }
  else if(cday<=(4.0*23.0*360.0/108.0))
  {
    CNkh="Dhanishtha";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
  }
  else if(cday<=(4.0*24.0*360.0/108.0))
  {
    CNkh="Shatataraka";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[24];
      Fal_str=fal[17];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[20];
      Fal_str=fal[8];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[16];
      Fal_str=fal[1];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[12];
      Fal_str=fal[3];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[8];
      Fal_str=fal[6];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[4];
      Fal_str=fal[3];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[0];
      Fal_str=fal[0];
    }
  }
  else if(cday<=(4.0*25.0*360.0/108.0))
  {
    CNkh="PoorvaBhadrapada";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[25];
      Fal_str=fal[14];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[21];
      Fal_str=fal[11];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[17];
      Fal_str=fal[13];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[13];
      Fal_str=fal[10];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[9];
      Fal_str=fal[7];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[5];
      Fal_str=fal[4];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[1];
      Fal_str=fal[1];
    }
  }
  else if(cday<=(4.0*26.0*360.0/108.0))
  {
    CNkh="UttaraBhadrapada";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[26];
      Fal_str=fal[18];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[22];
      Fal_str=fal[6];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[18];
      Fal_str=fal[14];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[14];
      Fal_str=fal[10];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[10];
      Fal_str=fal[8];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[6];
      Fal_str=fal[3];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[2];
      Fal_str=fal[2];
    }
  }
  else if(cday<=(4.0*27.0*360.0/108.0))
  {
    CNkh="Revati";
    if(day == 7 && hour >= 6 || day == 1 && hour < 6)
    {
      Yog_str=yog[27];
      Fal_str=fal[19];
    }
    else if(day ==1 && hour >= 6 || day == 2 && hour < 6)
    {
      Yog_str=yog[23];
      Fal_str=fal[16];
    }
    else if(day ==2 && hour >= 6 || day == 3 && hour < 6)
    {
      Yog_str=yog[19];
      Fal_str=fal[15];
    }
    else if(day ==3 && hour >= 6 || day == 4 && hour < 6)
    {
      Yog_str=yog[15];
      Fal_str=fal[12];
    }
    else if(day ==4 && hour >= 6 || day == 5 && hour < 6)
    {
      Yog_str=yog[11];
      Fal_str=fal[9];
    }
    else if(day ==5 && hour >= 6 || day == 6 && hour < 6)
    {
      Yog_str=yog[7];
      Fal_str=fal[5];
    }
    else if(day ==6 && hour >= 6 || day ==7 && hour < 6)
    {
      Yog_str=yog[3];
      Fal_str=fal[3];
    }
  }
  if(Yog_str==("Gada") || Yog_str==("Kaal") || Yog_str==("Dhoomra") || Yog_str==("Dhvanksha") || Yog_str==("Vajra")
      || Yog_str==("Mudgar") || Yog_str==("Lumbak") || Yog_str==("Utpaat") || Yog_str==("Mrutyu") || Yog_str==("Kon")
      || Yog_str==("Musal") || Yog_str==("Gada") || Yog_str==("Rakshas"))
  {

//22,1,2,5,8,9,14,15,16,17,21,22,24
    yogbad=true;
    yoggood=false;
  }
  else
  {
    yogbad=false;
    yoggood=true;
  }
  List<String> return_value=[Yog_str,Fal_str,CRashi,CNkh,"$yogbad","$yoggood"];
  print(return_value);
  return return_value;
}
}