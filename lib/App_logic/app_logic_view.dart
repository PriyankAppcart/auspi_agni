import 'package:auspi_agni_flutter/App_logic/app_logic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class app_logic_view extends StatelessWidget{

  var logicController = Get.put(app_logic_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuspiSeven Dial'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: GetBuilder<app_logic_controller>(
            init: app_logic_controller(),
            builder: (controller) => Column(children: [
               Row(
                 children: [
                   Text(logicController.bharatiya_saur),
                 ],
               ),
              setData(logicController.days,logicController.current_Time),
              SizedBox(height: 10),
              setData("Sun-Rashi",logicController.SunRashi),
              SizedBox(height: 10),
              setData("Nakshatra",logicController.SunNksh),
              SizedBox(height: 10),
              setData("Rutu",logicController.SunRutu),
              SizedBox(height: 10),
              setData("Ayan",logicController.SunAyan),
              SizedBox(height: 15),
              setData("Moon-Rashi",logicController.CRashi),
              SizedBox(height: 10),
              setData("Nakshatra",logicController.CNkh),
              SizedBox(height: 10),
              setDataRed("Anandadi Yog",logicController.Yog_str,logicController.yoggood),
              SizedBox(height: 10),
              setDataRed("Phal",logicController.Fal_str,logicController.yoggood),
              SizedBox(height: 10),
              setData("Hora (${logicController.Hora_duration} min)","${logicController.graha} (Ends: ${logicController.Hora_end})"),
              SizedBox(height: 10),
              setData("Rahu Kal",logicController.Rahukal),
              SizedBox(height: 10),
              setData("Sun Rise",logicController.SunRise),
              SizedBox(height: 10),
              setData("Sun Set",logicController.SunSet),
              SizedBox(height: 10),
              setData("Moon Age",logicController.MoonAge),
              SizedBox(height: 10),
              setData("Moon Light",logicController.MoonIllumination),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.only(left:2*(MediaQuery.of(context).size.width/100),right:2*(MediaQuery.of(context).size.width/100)  ),
                child: Container(
                  height: 39*(MediaQuery.of(context).size.height/100),
                  width: 39*(MediaQuery.of(context).size.height/100),
                  child: Stack(
                    children: [
                      Container(
                        //height: 480,
                       // width: 480,
                        child: Image.asset("assets/${logicController.days.toLowerCase()}.png",fit: BoxFit.fill),
                      ),
                      Transform.rotate(
                        angle: (logicController.hour_rotation*pi)/180,
                        child: Center(child: Image.asset("assets/hourhand.png")),
                      ),
                      Transform.rotate(
                        angle: ((double.parse("${logicController.minutes_rotation}"))*pi)/180,
                        child: Center(child: Image.asset("assets/minutehand.png")),
                      ),

                      Transform.rotate(
                        angle: ((double.parse("${logicController.seconds_rotation}"))*pi)/180,
                        child: Center(child: Image.asset("assets/sechand.png")),
                      ),

                    ],
                  ),
                ),
              )

              //GestureDetector(
                 // onTap: () async {
                    //final result = await logicController.getTransactionSummeryList();
                   // final result2 = await logicController.getSunSummeryList();
                   // print(logicController.Moonphase[0].illumination);
                   // print(logicController.Moonphase[0].phase);

                 // },
                 // child: Text("click me"))

            ],),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  setData(title,value){
    return Row(
      children: [
        Expanded(flex: 1,
            child: Text(title)),
        Expanded(flex: 2,
            child: Text(value)),
      ],
    );
  }
  setDataRed(title,value,yog_good){
    return Row(
      children: [
        Expanded(flex: 1,
            child: Text(title,style:TextStyle( color:yog_good=="true"?Colors.green:Colors.red,))),
        Expanded(flex: 2,
            child: Text(value,style:TextStyle( color:yog_good=="true"?Colors.green:Colors.red,))),
      ],
    );
  }

}