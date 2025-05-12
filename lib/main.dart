import 'package:auspi_agni_flutter/AppTheme.dart';
import 'package:auspi_agni_flutter/App_logic/app_logic_controller.dart';
import 'package:auspi_agni_flutter/App_logic/app_logic_controller_background.dart';
import 'package:auspi_agni_flutter/App_logic/main_view.dart';
import 'package:auspi_agni_flutter/Notifications/LocalNotificationService.dart';
import 'package:auspi_agni_flutter/SizeConfig.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:workmanager/workmanager.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);// To turn of
  await GetStorage.init();
  LocalNotificationService.initialize();
  await LocalNotificationService.configureLocalTimeZone();
 // await initializeService();
 // await initializeService();
 Workmanager().initialize(
     callbackDispatcher, // The top level function, aka callbackDispatcher
     isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
 );
Workmanager().registerOneOffTask("task-identifier", "simpleTask",initialDelay: Duration(seconds: 60));
  // Workmanager().registerPeriodicTask(
  //   "simplePeriodicTask",
  //   "simplePeriodic1HourTask",
  //   frequency: Duration(minutes: 5),
  // );
  // await Workmanager().cancelAll();
  // print('Cancel all tasks completed');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final logicController = Get.put(app_logic_controller());
    return
      LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Auspi Seven in One',
                theme: logicController.isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme,
                home: MainView(),
              );
            },
          );
        },
      );
  }
}
/*
getPage(){
  try{
    if(ApiClient.box.read('login')){
      print("userRole  : ${ApiClient.box.read('userRole')}");
      return Dashboard();
    }else{
      return Login();
    }
  }catch(e){
    return Login();
  }

}
*/
@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher()  {

  Workmanager().executeTask((task, inputData) async {

    var logicController = Get.put(app_logic_controller_background());
    logicController.getLocation();
    // commonStorage.box.read('long');
    // commonStorage.box.read('lat');
    // commonStorage.box.read('TimeZone');

    // print("TimeZone${commonStorage.box.read('TimeZone')}");
   await logicController.getSunSummeryList();
   await logicController.getNextdaySunSummeryList();
   await  logicController.getMoonPhaseSummeryList();
   await logicController.getPrevdaySunSummeryList();
   await  logicController.background_calculate();
    //logicController.scheduleDailyTenAMNotification();
    print("Native called background task: ${DateTime.now()} "); //simpleTask will be emitted here.
    return Future.value(true);
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }}