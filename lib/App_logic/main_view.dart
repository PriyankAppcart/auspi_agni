import 'dart:math';

import 'package:auspi_agni_flutter/App_logic/app_logic_controller.dart';
import 'package:auspi_agni_flutter/App_logic/sectetion_list.dart';
import 'package:auspi_agni_flutter/RemoteServices/cust_text_center.dart';
import 'package:auspi_agni_flutter/SizeConfig.dart';
import 'package:auspi_agni_flutter/cloack_dial.dart';
import 'package:auspi_agni_flutter/cust_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:praniti/customFields/cust_text.dart';
// import 'package:praniti/subscription/subscription_controller.dart';
// import 'package:praniti/util/SizeConfig.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  var logicController = Get.put(app_logic_controller());

  // Function to check if critical data is loaded
  bool isDataLoaded(app_logic_controller controller) {
    return controller.City.isNotEmpty &&
        controller.bharatiya_saur.isNotEmpty &&
        controller.CRashi.isNotEmpty &&
        controller.CNkh.isNotEmpty &&
        controller.MoonRise.isNotEmpty &&
        controller.MoonSet.isNotEmpty &&
        controller.Yog_endtime.isNotEmpty &&
        controller.Hindu_month.isNotEmpty &&
        controller.MoonTithi.isNotEmpty &&
        controller.KaranText.isNotEmpty &&
        controller.AgniText.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFFAFAFB),
      body: GetBuilder<app_logic_controller>(
        init: app_logic_controller(),
        builder: (controller) => Container(
          decoration: BoxDecoration(
            color: !controller.enableDeviceLocation ||
                    !controller.internetConnection ||
                    !isDataLoaded(controller)
                ? Colors
                    .white // White background for loading, internet, or GPS issues
                : null,
            gradient: controller.enableDeviceLocation &&
                    controller.internetConnection &&
                    isDataLoaded(controller)
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: logicController.isDarkMode.value
                        ? [
                            Color(0xFF0D1117),
                            Color(0xFF161B22),
                            Color(0xFF0D1117),
                          ]
                        : [
                            Color(0xFFE3F2FD),
                            Color.fromARGB(255, 163, 206, 242),
                            Color.fromARGB(255, 169, 219, 255),
                          ],
                  )
                : null,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 12 * SizeConfig.heightMultiplier,
                  width: 100 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: logicController.isDarkMode.value
                          ? [Color(0xFF0B3D91), Color(0xFF1E88E5)]
                          : [Color(0xFF0095da), Color(0xFF29b1ef)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: logicController.isDarkMode.value
                            ? Colors.black38
                            : Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 4 * SizeConfig.heightMultiplier,
                        left: 4 * SizeConfig.widthMultiplier,
                        right: 4 * SizeConfig.widthMultiplier),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustText(
                            name: "Auspi Agni ",
                            size: 2,
                            colors: Colors.white,
                            fontWeightName: FontWeight.w600),
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(5),
                        //       decoration: BoxDecoration(
                        //           color: Colors.lightBlue,
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(20))),
                        //       child: Row(
                        //         children: [
                        //           Icon(Icons.location_on,
                        //               color: Colors.white, size: 16),
                        //           SizedBox(
                        //               width: 1 * SizeConfig.widthMultiplier),
                        //           Text(
                        //             logicController.City,
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.w700),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(width: 2 * SizeConfig.widthMultiplier),
                        //     _buildThemeToggle(controller),
                        //   ],
                        // )

                        Row(
                          children: [
                            logicController.enableDeviceLocation
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          3 * SizeConfig.widthMultiplier,
                                      vertical:
                                          0.5 * SizeConfig.heightMultiplier,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            color: Colors.white, size: 16),
                                        SizedBox(
                                            width:
                                                1 * SizeConfig.widthMultiplier),
                                        Text(
                                          "${controller.City}",
                                          style: TextStyle(
                                            fontSize:
                                                1.4 * SizeConfig.textMultiplier,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(width: 2 * SizeConfig.widthMultiplier),
                            _buildThemeToggle(controller),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                logicController.enableDeviceLocation
                    ? logicController.internetConnection
                        ? isDataLoaded(controller)
                            ? Container(
                                height: 88 * SizeConfig.heightMultiplier,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      2 * SizeConfig.widthMultiplier),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Row(
                                        //   children: [
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       children: [
                                        //         CustText(
                                        //             name: "Bharatiya Saur: \n",
                                        //             size: 1.8,
                                        //             colors: Colors.black,
                                        //             fontWeightName:
                                        //                 FontWeight.w600),
                                        //       ],
                                        //     ),
                                        //     Container(
                                        //         width:
                                        //             61 * SizeConfig.widthMultiplier,

                                        //         child: CustText(
                                        //             name:
                                        //                 "${logicController.bharatiya_saur} \n${logicController.days} ${logicController.current_Time}",
                                        //             size: 1.8,
                                        //             colors: Colors.black,
                                        //             fontWeightName:
                                        //                 FontWeight.w600)),
                                        //   ],
                                        // ),

                                        Container(
                                          padding: EdgeInsets.all(
                                              3 * SizeConfig.widthMultiplier),
                                          decoration: BoxDecoration(
                                            color:
                                                logicController.isDarkMode.value
                                                    ? Colors.indigo
                                                        .withOpacity(0.15)
                                                    : Colors.indigo
                                                        .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: logicController
                                                        .isDarkMode.value
                                                    ? Colors.indigo
                                                        .withOpacity(0.3)
                                                    : Colors.indigo
                                                        .withOpacity(0.2),
                                                width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? Colors.black12
                                                        : Colors.indigo
                                                            .withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(2 *
                                                    SizeConfig.widthMultiplier),
                                                decoration: BoxDecoration(
                                                  color: logicController
                                                          .isDarkMode.value
                                                      ? Colors.indigo
                                                          .withOpacity(0.2)
                                                      : Colors.indigo
                                                          .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                  Icons.calendar_today,
                                                  color: logicController
                                                          .isDarkMode.value
                                                      ? Colors.cyanAccent
                                                      : Colors.indigo,
                                                  size: 6 *
                                                      SizeConfig
                                                          .widthMultiplier,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 3 *
                                                      SizeConfig
                                                          .widthMultiplier),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Bharatiya Saur",
                                                      style: TextStyle(
                                                        fontSize: 1.8 *
                                                            SizeConfig
                                                                .textMultiplier,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: logicController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors.cyanAccent
                                                            : Colors.indigo,
                                                        letterSpacing: 1.1,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 1 *
                                                            SizeConfig
                                                                .heightMultiplier),
                                                    Text(
                                                      "${logicController.bharatiya_saur}",
                                                      style: TextStyle(
                                                        fontSize: 2 *
                                                            SizeConfig
                                                                .textMultiplier,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: logicController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors.white
                                                            : Colors.black87,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 0.5 *
                                                            SizeConfig
                                                                .heightMultiplier),
                                                    Text(
                                                      "${logicController.days} ${logicController.current_Time}",
                                                      style: TextStyle(
                                                        fontSize: 1.6 *
                                                            SizeConfig
                                                                .textMultiplier,
                                                        color: logicController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors.white
                                                            : Colors.black54,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                            height: 2 *
                                                SizeConfig.heightMultiplier),
                                        // auspiSevenData(4,Color(0xFFefc000),"assets/sun_icon.png","","","Sun-Rashi","${logicController.SunRashi}",
                                        //     "Nakshatra","${logicController.SunNksh}","Rutu","${logicController.SunRutu}","Ayan","${logicController.SunAyan}","","","","","","","",""),
                                        // SizedBox(height: 1 * SizeConfig.heightMultiplier),
                                        auspiSevenData(
                                            9,
                                            Color(0xFF0196da),
                                            "assets/moon_icon.png",
                                            "Location ",
                                            "${logicController.City}, ${logicController.State}, ${logicController.Country}",
                                            "Moon-Rashi",
                                            "${logicController.CRashi}",
                                            "Nakshatra",
                                            "${logicController.CNkh} ${logicController.Nakshatra_endtime}",
                                            "MoonRise",
                                            "${logicController.MoonRise}",
                                            "Moonset",
                                            "${logicController.MoonSet}",
                                            "Yog",
                                            "${logicController.Yog_endtime}",
                                            "Moon Month",
                                            "${logicController.Hindu_month}",
                                            "Moon Tithi",
                                            "${logicController.MoonTithi} ${logicController.Tithi_endtime}",
                                            "Tithi Karan",
                                            "${logicController.KaranText} ${logicController.Karan_endtime}",
                                            "Agni",
                                            "${logicController.AgniText}"),
                                        SizedBox(
                                            height: 1 *
                                                SizeConfig.heightMultiplier),
                                        // auspiSevenData(11,Color(0xFFa6ce38),"assets/time_icon.png","Location ","${logicController.City}, ${logicController.State}, ${logicController.Country}","Hora (${logicController.Hora_duration} min)\n\n","${logicController.graha} \n(Starts:${logicController.Hora_start}) \n(Ends:${logicController.Hora_end})",
                                        //     "Rahu Kaal","\n(Starts:${logicController.rahukaalstartTime}) \n(Ends:${logicController.rahukaalendTime})","Sun-Rise","${logicController.SunRise}","Sun Set","${logicController.SunSet}","Moon Tithi","${logicController.MoonTithi} ${logicController.Tithi_endtime}","Tithi Karan","${logicController.KaranText} ${logicController.Karan_endtime}","Agni","${logicController.AgniText}","Ghatika Pal ","${logicController.MoonIllumination}"),
                                        // SizedBox(height: 2 * SizeConfig.heightMultiplier),
                                        Container(
                                          height:
                                              42 * SizeConfig.heightMultiplier,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: PageView(
                                            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                                            /// Use [Axis.vertical] to scroll vertically.
                                            controller:
                                                logicController.controller,
                                            onPageChanged: (int page) {
                                              logicController.indicator(page);
                                            },
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  // List<String> imgList = [
                                                  //   "assets/agni.png"
                                                  // ];
                                                  Get.to(ClockDialView(
                                                      logicController:
                                                          logicController));
                                                },
                                                child: Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2 *
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              100),
                                                      right: 2 *
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              100)),
                                                  child: Container(
                                                    height: 39 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    width: 39 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            //height: 480,
                                                            // width: 480,
                                                            child: Image.asset(
                                                                "assets/agni.png",
                                                                fit: BoxFit
                                                                    .fill),
                                                          ),
                                                        ),
                                                        Transform.rotate(
                                                          angle: (logicController
                                                                      .hour_rotation *
                                                                  pi) /
                                                              180,
                                                          child: Center(
                                                              child: Image.asset(
                                                                  "assets/hourhand.png",
                                                                  fit: BoxFit
                                                                      .fitHeight)),
                                                        ),
                                                        Transform.rotate(
                                                          angle: ((double.parse(
                                                                      "${logicController.minutes_rotation}")) *
                                                                  pi) /
                                                              180,
                                                          child: Center(
                                                              child: Image.asset(
                                                                  "assets/minutehand.png",
                                                                  fit: BoxFit
                                                                      .fitHeight)),
                                                        ),

                                                        Transform.rotate(
                                                          angle: ((double.parse(
                                                                      "${logicController.seconds_rotation}")) *
                                                                  pi) /
                                                              180,
                                                          child: Center(
                                                              child: Image.asset(
                                                                  "assets/sechand.png",
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                  color: Colors
                                                                      .black)),
                                                        ),

                                                        Transform.rotate(
                                                          angle: ((double.parse(
                                                                      "${logicController.Agni_hand}")) *
                                                                  pi) /
                                                              180,
                                                          child: Center(
                                                              child: Image.asset(
                                                                  "assets/agnihand.png",
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                  color: !logicController
                                                                          .Agni_Present
                                                                      ? Colors
                                                                          .black54
                                                                      : null)),
                                                        ),

                                                        if (logicController
                                                            .Agni_Present)
                                                          Transform.translate(
                                                            offset: Offset(
                                                                0,
                                                                -2.2 *
                                                                    SizeConfig
                                                                        .heightMultiplier), // Move up by 10 units
                                                            child: Center(
                                                              child:
                                                                  TweenAnimationBuilder<
                                                                      double>(
                                                                tween: Tween<
                                                                    double>(
                                                                  begin: 0,
                                                                  end: 20 *
                                                                      SizeConfig
                                                                          .widthMultiplier, // Target size
                                                                ),
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            2),
                                                                builder: (BuildContext
                                                                        context,
                                                                    double size,
                                                                    Widget?
                                                                        child) {
                                                                  return SizedBox(
                                                                    width: size,
                                                                    height:
                                                                        size,
                                                                    child:
                                                                        child,
                                                                  );
                                                                },
                                                                child:
                                                                    Image.asset(
                                                                  "assets/agnilogo512.png",
                                                                  fit: BoxFit
                                                                      .contain, // Maintain aspect ratio
                                                                ),
                                                              ),
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
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: 2 *
                                                SizeConfig.heightMultiplier),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 2 *
                                                  SizeConfig.widthMultiplier,
                                              width: 2 *
                                                  SizeConfig.widthMultiplier,
                                              decoration: BoxDecoration(
                                                  color: logicController
                                                              .pageindicator ==
                                                          0
                                                      ? Color(0xFF29b1ef)
                                                      : Colors.black12,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                                width: 1 *
                                                    SizeConfig.widthMultiplier),
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
                                        SizedBox(
                                            height: 4 *
                                                SizeConfig.heightMultiplier),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Container(
                                  height: 80 * SizeConfig.heightMultiplier,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/splash.png',
                                        height: 40 * SizeConfig.widthMultiplier,
                                        width: 40 * SizeConfig.widthMultiplier,
                                      ),
                                      SizedBox(
                                          height:
                                              3 * SizeConfig.heightMultiplier),
                                      CustText(
                                        name: "Loading Data...",
                                        size: 1.8,
                                        colors: logicController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeightName: FontWeight.w600,
                                      ),
                                      SizedBox(
                                          height:
                                              2 * SizeConfig.heightMultiplier),
                                      const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xFF29b1ef)),
                                      ),
                                      SizedBox(
                                          height:
                                              2 * SizeConfig.heightMultiplier),
                                      Container(
                                        width: 85 * SizeConfig.widthMultiplier,
                                        child: CustTextCenter(
                                          name:
                                              "Please wait while we fetch the auspicious time data.",
                                          size: 1.8,
                                          colors:
                                              logicController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeightName: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                        : Center(
                            child: Container(
                              height: 80 * SizeConfig.heightMultiplier,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/splash.png',
                                    height: 40 * SizeConfig.widthMultiplier,
                                    width: 40 * SizeConfig.widthMultiplier,
                                  ),
                                  SizedBox(
                                    height: 3 * SizeConfig.heightMultiplier,
                                  ),
                                  CustText(
                                      name:
                                          "Internet Connection Not available.",
                                      size: 1.8,
                                      colors: Colors.black,
                                      fontWeightName: FontWeight.w600),
                                  SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier,
                                  ),
                                  Container(
                                    width: 85 * SizeConfig.widthMultiplier,
                                    child: CustTextCenter(
                                        name:
                                            "To get accurate AUSPICIOUS time please turn on your device's Internet Connection.",
                                        size: 1.8,
                                        colors: Colors.black,
                                        fontWeightName: FontWeight.w400),
                                  ),
                                  SizedBox(
                                      height:
                                          2.5 * SizeConfig.heightMultiplier),
                                  ElevatedButton(
                                    onPressed: () {
                                      logicController.checkGps();
                                    },
                                    // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                                    style: ElevatedButton.styleFrom(
                                        elevation: 12.0,
                                        textStyle: const TextStyle(
                                            color: Colors.white)),
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
                                ],
                              ),
                            ),
                          )
                    : Center(
                        child: Container(
                          height: 80 * SizeConfig.heightMultiplier,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/splash.png',
                                height: 40 * SizeConfig.widthMultiplier,
                                width: 40 * SizeConfig.widthMultiplier,
                              ),
                              SizedBox(
                                height: 3 * SizeConfig.heightMultiplier,
                              ),
                              CustText(
                                  name: "GPS Service",
                                  size: 2,
                                  colors: Colors.black,
                                  fontWeightName: FontWeight.w700),
                              SizedBox(
                                height: 1 * SizeConfig.heightMultiplier,
                              ),
                              Container(
                                width: 85 * SizeConfig.widthMultiplier,
                                child: CustTextCenter(
                                    name:
                                        "GPS Service is not enabled, To get accurate AUSPICIOUS time at your location, please turn on your device's GPS location.",
                                    size: 1.8,
                                    colors: Colors.black,
                                    fontWeightName: FontWeight.w400),
                              ),
                              SizedBox(
                                  height: 2.5 * SizeConfig.heightMultiplier),
                              ElevatedButton(
                                onPressed: () {
                                  logicController.checkGps();
                                },
                                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                                style: ElevatedButton.styleFrom(
                                    elevation: 12.0,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                                child: const Text('Refresh'),
                              ),
                              SizedBox(
                                height: 2.5 * SizeConfig.heightMultiplier,
                              ),
                              Container(
                                width: 85 * SizeConfig.widthMultiplier,
                                child: CustTextCenter(
                                    name: "To select preset location ",
                                    size: 1.8,
                                    colors: Colors.black,
                                    fontWeightName: FontWeight.w400),
                              ),
                              SizedBox(height: 1 * SizeConfig.heightMultiplier),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          sectetionList(
                                            dataList:
                                                logicController.mapLatLong,
                                            onSelected: (city, lat, long) {
                                              print(
                                                  "Selected city $city , $lat, $long");
                                              logicController.getLocationPreset(
                                                  lat, long);
                                            },
                                          ));
                                },
                                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                                style: ElevatedButton.styleFrom(
                                    elevation: 12.0,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                                child: const Text('Click here'),
                              ),
                              SizedBox(height: 1 * SizeConfig.heightMultiplier),
                              ElevatedButton(
                                onPressed: () {
                                  try {
                                    launch(
                                        "https://auspiwatch.com/auspiwatchprivacypolicy.html");
                                  } catch (e) {}
                                },
                                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),

                                style: ElevatedButton.styleFrom(
                                    elevation: 12.0,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
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
                            ],
                          ),
                        ),
                      ),
              ]),
        ),
      ),
    );
  }

  Widget auspiSevenData(
    int boxHeight, // Kept for compatibility, but not used for height
    Color colorName,
    String img,
    String title7,
    String butitle7,
    String title1,
    String butitle1,
    String title2,
    String butitle2,
    String title3,
    String butitle3,
    String title4,
    String butitle4,
    String title5,
    String butitle5,
    String title8,
    String butitle8,
    String title9,
    String butitle9,
    String title6,
    String butitle6,
    String title10,
    String butitle10,
  ) {
    return Padding(
      padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
      child: Container(
        decoration: BoxDecoration(
          color: logicController.isDarkMode.value
              ? Colors.grey.shade900.withOpacity(0.7)
              : Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(2 * SizeConfig.widthMultiplier)),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch children to match tallest
            children: [
              Container(
                width: 11 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                  color: colorName.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2 * SizeConfig.widthMultiplier),
                    bottomLeft: Radius.circular(2 * SizeConfig.widthMultiplier),
                  ),
                  // border: Border(
                  //   left: BorderSide(color: colorName, width: 3),
                  // ),
                ),
                child: Center(
                  // Center the image vertically
                  child: Padding(
                    padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
                    child: Image.asset(
                      img,
                      height: 8 * SizeConfig.widthMultiplier,
                      width: 8 * SizeConfig.widthMultiplier,
                      fit: BoxFit.fitWidth,
                      color: colorName,
                    ),
                  ),
                ),
              ),
              Expanded(
                // Expand to take available space and drive height
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2 * SizeConfig.widthMultiplier,
                    vertical: 1 * SizeConfig.heightMultiplier,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (logicController.City != "")
                        auspiSevenSubData(title7, butitle7),
                      SizedBox(
                          height:
                              SizeConfig.heightMultiplier), // Vertical spacing
                      auspiSevenSubData(title1, butitle1),
                      SizedBox(height: SizeConfig.heightMultiplier),
                      auspiSevenSubData(title2, butitle2),
                      SizedBox(height: SizeConfig.heightMultiplier),
                      title3 == "Anandadi Yog"
                          ? auspiSevenSubYogData(title3, butitle3)
                          : auspiSevenSubData(title3, butitle3),
                      SizedBox(height: SizeConfig.heightMultiplier),
                      title4 == "Phal"
                          ? auspiSevenSubYogData(title4, butitle4)
                          : auspiSevenSubData(title4, butitle4),
                      if (butitle5 != "") ...[
                        SizedBox(height: SizeConfig.heightMultiplier),
                        auspiSevenSubData(title5, butitle5),
                      ],
                      if (butitle8 != "") ...[
                        SizedBox(height: SizeConfig.heightMultiplier),
                        auspiSevenSubData(title8, butitle8),
                      ],
                      if (butitle9 != "") ...[
                        SizedBox(height: SizeConfig.heightMultiplier),
                        auspiSevenSubData(title9, butitle9),
                      ],
                      if (butitle6 != "") ...[
                        SizedBox(height: SizeConfig.heightMultiplier),
                        auspiSevenSubData(title6, butitle6),
                      ],
                      if (butitle10 != "") ...[
                        SizedBox(height: SizeConfig.heightMultiplier),
                        auspiSevenSubData(title10, butitle10),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // auspiSevenSubData(title, bubTitle) {
  //   return Container(
  //     width: 80 * SizeConfig.widthMultiplier,
  //     child: Padding(
  //       padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Expanded(
  //               flex: 3,
  //               child: Row(
  //                 children: [
  //                   CustText(
  //                       name: title,
  //                       size: 1.6,
  //                       colors: Color(0xFF29b1ef),
  //                       fontWeightName: FontWeight.w600),
  //                 ],
  //               )),
  //           Expanded(
  //               flex: 5,
  //               child: Row(
  //                 children: [
  //                   CustText(
  //                       name: bubTitle,
  //                       size: 1.6,
  //                       colors: Color(0xFF565656),
  //                       fontWeightName: FontWeight.w600),
  //                 ],
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget auspiSevenSubData(String title, String bubTitle) {
    return Container(
      width: 80 * SizeConfig.widthMultiplier, // Responsive width
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical:
              1 * SizeConfig.heightMultiplier, // Increased vertical spacing
        ), // Responsive padding
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align children to the start (left)
          children: [
            Expanded(
                flex: 3,
                child: CustText(
                    name: title,
                    size: 1.6,
                    colors: logicController.isDarkMode.value
                        ? Colors.blue.shade300
                        : Colors.blue.shade700,
                    fontWeightName: FontWeight.w700)),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.centerLeft, // Align content to the left
                child: FittedBox(
                  fit: BoxFit.scaleDown, // Scale text down to prevent overflow
                  child: CustText(
                    name: bubTitle,
                    size: 1.6,
                    colors: logicController.isDarkMode.value
                        ? Colors.white
                        : Color(0xFF565656), // Dark gray text
                    fontWeightName: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  auspiSevenSubYogData(title, bubTitle) {
    return Container(
      width: 80 * SizeConfig.widthMultiplier,
      child: Padding(
        padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    CustText(
                        name: title,
                        size: 1.6,
                        colors: logicController.isDarkMode.value
                            ? Colors.blue.shade300
                            : Colors.blue.shade700,
                        fontWeightName: FontWeight.w600),
                  ],
                )),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    CustText(
                        name: bubTitle,
                        size: 1.6,
                        colors: logicController.yoggood == "true"
                            ? Colors.green
                            : Colors.red,
                        fontWeightName: FontWeight.w600),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(app_logic_controller controller) {
    return Container(
      height: 4 * SizeConfig.heightMultiplier,
      width: 4 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4 * SizeConfig.heightMultiplier),
          onTap: () {
            controller.toggleTheme();
          },
          child: Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              child: controller.isDarkMode.value
                  ? Icon(
                      Icons.light_mode,
                      key: ValueKey('light'),
                      color: Colors.amber,
                      size: 18,
                    )
                  : Icon(
                      Icons.dark_mode,
                      key: ValueKey('dark'),
                      color: Colors.white,
                      size: 18,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}


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