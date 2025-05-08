import 'dart:math';

import 'package:auspi_agni_flutter/App_logic/app_logic_controller.dart';
import 'package:auspi_agni_flutter/App_logic/sectetion_list.dart';
import 'package:auspi_agni_flutter/RemoteServices/cust_text_center.dart';
import 'package:auspi_agni_flutter/SizeConfig.dart';
import 'package:auspi_agni_flutter/cust_text.dart';
import 'package:auspi_agni_flutter/photosViewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:praniti/customFields/cust_text.dart';
// import 'package:praniti/subscription/subscription_controller.dart';
// import 'package:praniti/util/SizeConfig.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  var logicController = Get.put(app_logic_controller());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color(0xFFFAFAFB),
      body: GetBuilder<app_logic_controller>(
        init: app_logic_controller(),
        builder: (controller) => Container(
          color:logicController.enableDeviceLocation || logicController.internetConnection?Colors.white:Color(0xFFFAFAFB),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 12 * SizeConfig.heightMultiplier,
                  width: 100 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF0095da),Color(0xFF29b1ef)],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 4 * SizeConfig.heightMultiplier,left: 4 * SizeConfig.widthMultiplier),
                    child: Row(
                      children: [
                        CustText(name: "Auspi Agni ",size: 2,colors:Colors.white,fontWeightName:FontWeight.w600),
                      ],
                    ),
                  ),
                ),
                logicController.enableDeviceLocation?logicController.internetConnection?
                Container(
                  height: 88 * SizeConfig.heightMultiplier,
                  child: Padding(
                    padding: EdgeInsets.all(2 * SizeConfig.widthMultiplier),
                    child: SingleChildScrollView(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustText(name: "Bharatiya Saur: \n",size: 1.8,colors:Colors.black,fontWeightName:FontWeight.w600),
                                ],
                              ),


                              Container(
                                  width: 61* SizeConfig.widthMultiplier,
                                  child: CustText(name: "${logicController.bharatiya_saur} \n${logicController.days} ${logicController.current_Time}",size: 1.8,colors:Colors.black,fontWeightName:FontWeight.w600)),


                            ],
                          ),
                          SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          // auspiSevenData(4,Color(0xFFefc000),"assets/sun_icon.png","","","Sun-Rashi","${logicController.SunRashi}",
                          //     "Nakshatra","${logicController.SunNksh}","Rutu","${logicController.SunRutu}","Ayan","${logicController.SunAyan}","","","","","","","",""),
                          // SizedBox(height: 1 * SizeConfig.heightMultiplier),
                          auspiSevenData(9,Color(0xFF0196da),"assets/moon_icon.png","Location ","${logicController.City}, ${logicController.State}, ${logicController.Country}","Moon-Rashi","${logicController.CRashi}",
                              "Nakshatra","${logicController.CNkh} ${logicController.Nakshatra_endtime}","MoonRise","${logicController.MoonRise}","Moonset","${logicController.MoonSet}","Yog","${logicController.Yog_endtime}","Moon Month","${logicController.Hindu_month}","Moon Tithi","${logicController.MoonTithi} ${logicController.Tithi_endtime}","Tithi Karan","${logicController.KaranText} ${logicController.Karan_endtime}","Agni","${logicController.AgniText}"),
                          SizedBox(height: 1 * SizeConfig.heightMultiplier),
                          // auspiSevenData(11,Color(0xFFa6ce38),"assets/time_icon.png","Location ","${logicController.City}, ${logicController.State}, ${logicController.Country}","Hora (${logicController.Hora_duration} min)\n\n","${logicController.graha} \n(Starts:${logicController.Hora_start}) \n(Ends:${logicController.Hora_end})",
                          //     "Rahu Kaal","\n(Starts:${logicController.rahukaalstartTime}) \n(Ends:${logicController.rahukaalendTime})","Sun-Rise","${logicController.SunRise}","Sun Set","${logicController.SunSet}","Moon Tithi","${logicController.MoonTithi} ${logicController.Tithi_endtime}","Tithi Karan","${logicController.KaranText} ${logicController.Karan_endtime}","Agni","${logicController.AgniText}","Ghatika Pal ","${logicController.MoonIllumination}"),
                          // SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          Container(
                            height: 42 * SizeConfig.heightMultiplier,
                            child: PageView(
                              /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                              /// Use [Axis.vertical] to scroll vertically.
                              controller: logicController.controller,
                              onPageChanged: (int page){
                                logicController.indicator(page);
                              },
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    List<String> imgList = ["assets/agni.png"];
                                    Get.to(PhotosViewPage(imgList));
                                  },
                                  child: Center(
                                      child:  Padding(
                                        padding:  EdgeInsets.only(left:2*(MediaQuery.of(context).size.width/100),right:2*(MediaQuery.of(context).size.width/100)  ),
                                        child: Container(
                                          height: 39 * SizeConfig.heightMultiplier,
                                          width:  39 * SizeConfig.heightMultiplier,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  //height: 480,
                                                  // width: 480,
                                                  child: Image.asset("assets/agni.png",fit: BoxFit.fill),
                                                ),
                                              ),
                                              Transform.rotate(
                                                angle: (logicController.hour_rotation*pi)/180,
                                                child: Center(child: Image.asset("assets/hourhand.png",fit: BoxFit.fitHeight)),
                                              ),
                                              Transform.rotate(
                                                angle: ((double.parse("${logicController.minutes_rotation}"))*pi)/180,
                                                child: Center(child: Image.asset("assets/minutehand.png",fit: BoxFit.fitHeight)),
                                              ),

                                              Transform.rotate(
                                                angle: ((double.parse("${logicController.seconds_rotation}"))*pi)/180,
                                                child: Center(child: Image.asset("assets/sechand.png",fit: BoxFit.fitHeight,
                                                    color:Colors.black)),
                                              ),

                                              Transform.rotate(
                                                angle: ((double.parse("${logicController.Agni_hand}"))*pi)/180,
                                                child: Center(child: Image.asset("assets/agnihand.png",fit: BoxFit.fitHeight,
                                                    color:!logicController.Agni_Present?Colors.black54:null)),
                                              ),
                                              if(logicController.Agni_Present)
                                                Center(
                                                  child: TweenAnimationBuilder<double>(
                                                    tween: Tween<double>(begin: 0, end: 20 * SizeConfig.widthMultiplier),
                                                    duration: const Duration(seconds: 2),
                                                    builder: (BuildContext context, double size, Widget? child) {
                                                      return IconButton(
                                                        iconSize: size,
                                                        // color: Colors.blue,
                                                        icon: child!,
                                                        onPressed: () {

                                                        },
                                                      );
                                                    },
                                                    child: Image.asset("assets/agnilogo512.png",fit: BoxFit.fitWidth),
                                                  ),
                                                ),
                                              // logicController.Agni_Present?Center(
                                              //   child: Container(
                                              //     //padding:  EdgeInsets.only(bottom: 10 * SizeConfig.heightMultiplier,left: 13 * SizeConfig.widthMultiplier),
                                              //     height: 10 * SizeConfig.heightMultiplier,
                                              //     width:  10 * SizeConfig.heightMultiplier,
                                              //     child: Image.asset("assets/agnilogo512.png",fit: BoxFit.fill),
                                              //   ),
                                              // ):Container(),

                                            ],
                                          ),
                                        ),
                                      )
                                  ),
                                ),

                                // GestureDetector(
                                //   onTap: (){
                                //     List<String> imgList = ["assets/chandra.png"];
                                //     Get.to(PhotosViewPage(imgList));
                                //   },
                                //   child: Center(
                                //       child:  Padding(
                                //         padding:  EdgeInsets.only(left:2*(MediaQuery.of(context).size.width/100),right:2*(MediaQuery.of(context).size.width/100)  ),
                                //         child: Container(
                                //           height: 39 * SizeConfig.heightMultiplier,
                                //           width:  39 * SizeConfig.heightMultiplier,
                                //           child: Stack(
                                //             children: [
                                //               Center(
                                //                 child: Container(
                                //                   //height: 480,
                                //                   // width: 480,
                                //                   child: Image.asset("assets/chandra.png",fit: BoxFit.fill),
                                //                 ),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: (logicController.hour_rotation*pi)/180,
                                //                 child: Center(child: Image.asset("assets/hourhand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.minutes_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/minutehand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.seconds_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/sechand.png",fit: BoxFit.fitHeight,
                                //                     color:Colors.black)),
                                //               ),
                                //
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Saturn_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/shani.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.grey)),
                                //               // ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Jupiter_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/guru.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.pinkAccent)),
                                //               // ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Mars_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/mangal.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.indigo)),
                                //               // ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Venus_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/shukra.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.lightGreen)),
                                //               // ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Mercury_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/budh.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.yellowAccent)),
                                //               // ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Rahu_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/ketu.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.deepPurple)),
                                //               // ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Ketu_deg}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/ketu.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.brown)),
                                //               // ),
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.cday}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/moonh.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: (logicController.Tithi_hand*pi)/180,
                                //                 child: Center(child: Image.asset("assets/tithi_hand.png",fit: BoxFit.fitHeight,
                                //                     color:Colors.amber)),
                                //               ),
                                //
                                //             ],
                                //           ),
                                //         ),
                                //       )
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //     logicController.scheduleDailyTenAMNotification();
                                //     List<String> imgList = ["assets/${logicController.days.toLowerCase()}.png"];
                                //     Get.to(PhotosViewPage(imgList));
                                //   },
                                //   child: Center(
                                //       child:  Padding(
                                //         padding:  EdgeInsets.only(left:2*(MediaQuery.of(context).size.width/100),right:2*(MediaQuery.of(context).size.width/100)  ),
                                //         child: Container(
                                //           height: 39 * SizeConfig.heightMultiplier,
                                //           width:  39 * SizeConfig.heightMultiplier,
                                //
                                //           child: Stack(
                                //             children: [
                                //               Center(
                                //                 child: Container(
                                //                   //height: 480,
                                //                   // width: 480,
                                //                   child: Image.asset("assets/${logicController.days.toLowerCase()}.png",fit: BoxFit.fill),
                                //                 ),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: (logicController.hour_rotation*pi)/180,
                                //                 child: Center(child: Image.asset("assets/hourhand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.minutes_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/minutehand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.seconds_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/sechand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //
                                //             ],
                                //           ),
                                //         ),
                                //       )
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //     List<String> imgList = ["assets/help1.png"];
                                //     Get.to(PhotosViewPage(imgList));
                                //   },
                                //   child: Center(
                                //     child: Image.asset("assets/help1.png",
                                //         height: 42 * SizeConfig.heightMultiplier,
                                //         width: 100 * SizeConfig.widthMultiplier,fit: BoxFit.fitHeight),
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //     List<String> imgList = ["assets/anandadiyog.png"];
                                //     Get.to(PhotosViewPage(imgList));
                                //   },
                                //   child: Center(
                                //       child:  Padding(
                                //         padding:  EdgeInsets.only(left:2*(MediaQuery.of(context).size.width/100),right:2*(MediaQuery.of(context).size.width/100)  ),
                                //         child: Container(
                                //           height: 39 * SizeConfig.heightMultiplier,
                                //           width:  39 * SizeConfig.heightMultiplier,
                                //           child: Stack(
                                //             children: [
                                //               Center(
                                //                 child: Container(
                                //                   //height: 480,
                                //                   // width: 480,
                                //                   child: Image.asset("assets/anandadiyog.png",fit: BoxFit.fill),
                                //                 ),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: (logicController.hour_rotation*pi)/180,
                                //                 child: Center(child: Image.asset("assets/hourhand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.minutes_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/minutehand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.seconds_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/sechand.png",fit: BoxFit.fitHeight,color:Colors.blueGrey)),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.cday}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/moonhand.png",fit: BoxFit.fitHeight,
                                //                     color:logicController.yoggood=="true"?Colors.green:Colors.red)),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       )
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: (){
                                //     List<String> imgList = ["assets/sour.png"];
                                //     Get.to(PhotosViewPage(imgList));
                                //   },
                                //   child: Center(
                                //       child:  Padding(
                                //         padding:  EdgeInsets.only(left:2*(MediaQuery.of(context).size.width/100),right:2*(MediaQuery.of(context).size.width/100)  ),
                                //         child: Container(
                                //           height: 39 * SizeConfig.heightMultiplier,
                                //           width:  39 * SizeConfig.heightMultiplier,
                                //           child: Stack(
                                //             children: [
                                //               Center(
                                //                 child: Container(
                                //                   //height: 480,
                                //                   // width: 480,
                                //                   child: Image.asset("assets/sour.png",fit: BoxFit.fill),
                                //                 ),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: (logicController.hour_rotation*pi)/180,
                                //                 child: Center(child: Image.asset("assets/hourhand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.minutes_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/minutehand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.seconds_rotation}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/sechand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //
                                //               Transform.rotate(
                                //                 angle: ((double.parse("${logicController.Solar_deg}"))*pi)/180,
                                //                 child: Center(child: Image.asset("assets/sunhand.png",fit: BoxFit.fitHeight)),
                                //               ),
                                //               // Transform.rotate(
                                //               //   angle: ((double.parse("${logicController.Solar_deg_new}"))*pi)/180,
                                //               //   child: Center(child: Image.asset("assets/sunhand.png",fit: BoxFit.fitHeight,
                                //               //       color:Colors.purple)),
                                //               // ),
                                //
                                //             ],
                                //           ),
                                //         ),
                                //       )
                                //   ),
                                // ),

                              ],
                            ),
                          ),
                          SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2 * SizeConfig.widthMultiplier,
                                width: 2 * SizeConfig.widthMultiplier,
                                decoration: BoxDecoration(
                                    color: logicController.pageindicator == 0?Color(0xFF29b1ef):Colors.black12,
                                    shape: BoxShape.circle
                                ),
                              ),
                              SizedBox(width: 1 * SizeConfig.widthMultiplier),
                              // Container(
                              //   height: 2 * SizeConfig.widthMultiplier,
                              //   width: 2 * SizeConfig.widthMultiplier,
                              //   decoration: BoxDecoration(
                              //       color: logicController.pageindicator == 1?Color(0xFF29b1ef):Colors.black12,
                              //       shape: BoxShape.circle
                              //   ),
                              // ),
                              // SizedBox(width: 1 * SizeConfig.widthMultiplier),
                              // // Container(
                              //   height: 2 * SizeConfig.widthMultiplier,
                              //   width: 2 * SizeConfig.widthMultiplier,
                              //   decoration: BoxDecoration(
                              //       color: logicController.pageindicator == 2?Color(0xFF29b1ef):Colors.black12,
                              //       shape: BoxShape.circle
                              //   ),
                              // ),

                            ],
                          ),
                          SizedBox(height: 4 * SizeConfig.heightMultiplier),


                        ],
                      ),
                    ),
                  ),
                )
                    :Center(
                  child: Container(
                    height: 80  * SizeConfig.heightMultiplier,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/splash.png',
                          height: 40 * SizeConfig.widthMultiplier,
                          width: 40 * SizeConfig.widthMultiplier,),
                        SizedBox(height: 3 * SizeConfig.heightMultiplier,),
                        CustText(name: "Internet Connection Not available.",size: 1.8,colors:Colors.black,fontWeightName:FontWeight.w600),
                        SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                        Container(
                          width: 85  * SizeConfig.widthMultiplier,
                          child:CustTextCenter(name: "To get accurate AUSPICIOUS time please turn on your device's Internet Connection.",size: 1.8,colors:Colors.black,fontWeightName:FontWeight.w400),
                        ),

                        SizedBox(height: 2.5 * SizeConfig.heightMultiplier),
                        ElevatedButton(
                          onPressed: () {
                            logicController.checkGps();
                          },
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                          style: ElevatedButton.styleFrom(
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Refresh'),
                        ),
                        /* Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustButton(name: "Refresh",size: 80,
                                  onSelected: (flag) async {
                                    //    subscriptionController.getSubscriptionPlanList();
                                  })
                            ],
                          ),*/

                      ],),
                  ),
                )
                    :Center(
                  child: Container(
                    height: 80  * SizeConfig.heightMultiplier,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/splash.png',
                          height: 40 * SizeConfig.widthMultiplier,
                          width: 40 * SizeConfig.widthMultiplier,),
                        SizedBox(height: 3 * SizeConfig.heightMultiplier,),
                        CustText(name: "GPS Service",size: 2,colors:Colors.black,fontWeightName:FontWeight.w700),
                        SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                        Container(
                          width: 85  * SizeConfig.widthMultiplier,
                          child:CustTextCenter(name: "GPS Service is not enabled, To get accurate AUSPICIOUS time at your location, please turn on your device's GPS location.",size: 1.8,colors:Colors.black,fontWeightName:FontWeight.w400),
                        ),

                        SizedBox(height: 2.5 * SizeConfig.heightMultiplier),
                        ElevatedButton(
                          onPressed: () {
                            logicController.checkGps();
                          },
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                          style: ElevatedButton.styleFrom(
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Refresh'),
                        ),
                        SizedBox(height: 2.5 * SizeConfig.heightMultiplier,),
                        Container(
                          width: 85  * SizeConfig.widthMultiplier,
                          child:CustTextCenter(name: "To select preset location ",size: 1.8,colors:Colors.black,fontWeightName:FontWeight.w400),
                        ),

                        SizedBox(height: 1 * SizeConfig.heightMultiplier),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    sectetionList(
                                      dataList: logicController.mapLatLong,
                                      onSelected: (city, lat,long) {
                                        print("Selected city $city , $lat, $long");
                                        logicController.getLocationPreset(lat,long);
                                      },
                                    ));

                          },
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                          style: ElevatedButton.styleFrom(
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Click here'),
                        ),

                        SizedBox(height: 1 * SizeConfig.heightMultiplier),
                        ElevatedButton(
                          onPressed: () {

                            try{
                              launch("https://auspiwatch.com/auspiwatchprivacypolicy.html");
                            }catch(e)
                            {

                            }
                          },
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                          style: ElevatedButton.styleFrom(
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Privacy Policy'),
                        ),
                        /* Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustButton(name: "Refresh",size: 80,
                                  onSelected: (flag) async {
                                    //    subscriptionController.getSubscriptionPlanList();
                                  })
                            ],
                          ),*/

                      ],),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  auspiSevenData(boxHeight,colorName,img,title7,butitle7,title1,butitle1,title2,butitle2,title3,butitle3,title4,butitle4, title5,butitle5,title8,butitle8,title9,butitle9,title6,butitle6,title10,butitle10) {
    return Padding(
      padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
              2 * SizeConfig.widthMultiplier)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2 * SizeConfig.widthMultiplier,
            ),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: (4 * boxHeight) * SizeConfig.heightMultiplier,
                  width:10 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    color: colorName,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(
                        2 * SizeConfig.widthMultiplier),bottomLeft: Radius.circular(
                        2 * SizeConfig.widthMultiplier)),
                  ),child: Padding(
                  padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
                  child: Image.asset(img,
                      height: 6 * SizeConfig.widthMultiplier,
                      width: 6 * SizeConfig.widthMultiplier,fit: BoxFit.fitWidth),
                ),
                ),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
              children: [
                logicController.City !=""?auspiSevenSubData(title7,butitle7):Container(),
                auspiSevenSubData(title1,butitle1),
                //auspiSevenSubData(title7,butitle7),
                auspiSevenSubData(title2,butitle2),
                title3=="Anandadi Yog"?auspiSevenSubYogData(title3,butitle3):auspiSevenSubData(title3,butitle3),
                title4=="Phal"?auspiSevenSubYogData(title4,butitle4):auspiSevenSubData(title4,butitle4),
                butitle5 !=""?auspiSevenSubData(title5,butitle5):Container(),
                butitle8 !=""?auspiSevenSubData(title8,butitle8):Container(),
                butitle9 !=""?auspiSevenSubData(title9,butitle9):Container(),
                butitle6 !=""?auspiSevenSubData(title6,butitle6):Container(),
                butitle10 !=""?auspiSevenSubData(title10,butitle10):Container(),


              ],
            ),
          ],
        ),
      ),
    );
  }

  auspiSevenSubData(title,bubTitle){
    return Container(
      width: 80 * SizeConfig.widthMultiplier,
      child: Padding(
        padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 3,
                child: Row(
                  children: [
                    CustText(name: title,size: 1.6,colors:Color(0xFF29b1ef),fontWeightName:FontWeight.w600),
                  ],
                )),
            Expanded(flex: 5,
                child: Row(
                  children: [
                    CustText(name: bubTitle,size: 1.6,colors:Color(0xFF565656),fontWeightName:FontWeight.w600),
                  ],
                )),
          ],
        ),
      ),
    );
  }
  auspiSevenSubYogData(title,bubTitle){
    return Container(
      width: 80 * SizeConfig.widthMultiplier,
      child: Padding(
        padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 3,
                child: Row(
                  children: [
                    CustText(name: title,size: 1.6,colors:Color(0xFF29b1ef),fontWeightName:FontWeight.w600),
                  ],
                )),
            Expanded(flex: 5,
                child: Row(
                  children: [
                    CustText(name: bubTitle,size: 1.6,colors:logicController.yoggood=="true"?Colors.green:Colors.red,fontWeightName:FontWeight.w600),
                  ],
                )),
          ],
        ),
      ),
    );
  }

}


