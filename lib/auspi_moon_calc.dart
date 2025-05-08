//import 'dart:ffi';
import 'dart:math';


class auspi_moon_calc
{

  List<double> phase(double DateSec)
  {
    print("INCLASS $DateSec");

    double Epoch = 2444238.5;
    double Elonge = 278.83354;
    double Elongp = 282.596403;
    double Eccent = 0.016718;
    double Sunsmax = 149598500;
    double Sunangsiz = 0.533128;
    double Mmlong = 62.975464;
    double Mmlongp = 349.383063;
    double Mlnode = 151.950429;
    double Minc = 5.145396;
    double Mecc = 0.0549;
    double Mangsiz = 0.5181;
    double Msmax = 384401;
    double Mparallax = 0.9507;
    double Synmonth = 29.53058868;
    double pdate = (jtime(DateSec.roundToDouble()) - 28.9981134);
    double pphase;
    double mage;
    double dist;
    double angdia;
    double sudist;
    double suangdia;
    print("PDATE$pdate");
    double Day = (pdate - Epoch);
    double N = fixangle((360 ~/ 365.2422) * Day);
    double M = this.fixangle((N + Elonge) - Elongp);
    double Ec = this.kepler(M, Eccent);
    Ec = (sqrt((1 + Eccent) ~/ (1 - Eccent)) * tan(Ec ~/ 2));
    Ec = (2 * this.todeg(atan(Ec)));
    double Lambdasun = this.fixangle(Ec + Elongp);
    double F = ((1 + (Eccent * cos(this.torad(Ec)))) ~/ (1 - (Eccent * Eccent)))*1.000000 ;
    double SunDist = (Sunsmax ~/ F) *1.000000;
    double SunAng = (F * Sunangsiz);
    double ml = this.fixangle((13.1763966 * Day) + Mmlong);
    double MM = this.fixangle((ml - (0.1114041 * Day)) - Mmlongp);
    double MN = this.fixangle(Mlnode - (0.0529539 * Day));
    double Ev = (1.2739 * sin(this.torad((2 * (ml - Lambdasun)) - MM)));
    double Ae = (0.1858 * sin(this.torad(M)));
    double A3 = (0.37 * sin(this.torad(M)));
    double MmP = (((MM + Ev) - Ae) - A3);
    double mEc = (6.2886 * sin(this.torad(MmP)));
    double A4 = (0.214 * sin(this.torad(2 * MmP)));
    double lP = ((((ml + Ev) + mEc) - Ae) + A4);
    double V = (0.6583 * sin(this.torad(2 * (lP - Lambdasun))));
    double lPP = (lP + V);
    double NP = (MN - (0.16 * sin(this.torad(M))));
    double y = (sin(this.torad(lPP - NP)) * cos(this.torad(Minc)));
    double x = cos(this.torad(lPP - NP));
    double Lambdamoon = this.todeg(atan2(y, x));
    Lambdamoon += NP;
    double BetaM = this.todeg(asin(sin(this.torad(lPP - NP)) * sin(this.torad(Minc))));
    double MoonAge = (lPP - Lambdasun);
    double MoonPhase = ((1 - cos(this.torad(MoonAge))) ~/ 2) *1.000000;
    double MoonDist = ((Msmax * (1 - (Mecc * Mecc))) ~/ (1 + (Mecc * cos(this.torad(MmP + mEc))))) *1.000000;
    double MoonDFrac = (MoonDist ~/ Msmax) *1.000000;
   // double $MoonAng = (Mangsiz ~/ $MoonDFrac) as double;
   // double $MoonPar = (Mparallax ~/ $MoonDFrac) as double;
    pphase = MoonPhase;
    mage = (Synmonth * (this.fixangle(MoonAge) ~/ 360));
    dist = MoonDist;
   // angdia = $MoonAng;
    sudist = SunDist;
    suangdia = SunAng;
    double mpfrac = (fixangle(MoonAge) ~/ 360)*1.000000;
    print(lPP);
    print("Lambdasun$MoonAge");
    List<double> moon_calc= [(MoonPhase * 100) ,lPP ] ;
   // moon_calc[0] = ($MoonPhase * 100) as Double;
   // moon_calc[1] = $lPP as Double;
    return moon_calc;
  }

  double fixangle(double x)
  {
    var temp=(x ~/ 360);
    return x - (360 * temp.floor())*1.000000;
  }

  double torad(double x)
  {
    return x * (pi ~/ 180);
  }

  double todeg(double x)
  {
    return x * (180 ~/ pi);
  }

  double jtime(double t)
  {
    print("JTIME$t");
    double julian = ((t / 86400) + 2440587.5);
    return julian;
  }

  double kepler(double m, double $ecc)
  {
    double $EPSILON = 0.000001;
    m = this.torad(m);
    double $e = m;
    return $e;
  }
}