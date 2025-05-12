import 'dart:math';
import 'package:auspi_agni_flutter/App_logic/app_logic_controller.dart';
import 'package:auspi_agni_flutter/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockDialView extends StatelessWidget {
  final app_logic_controller logicController;

  const ClockDialView({Key? key, required this.logicController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the size of the clock container
    final clockSize = 80 * SizeConfig.heightMultiplier;
    // Define hand size as 60% of clock size to fit well within the dial
    final handSize = clockSize * 0.6;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20),
                  minScale: 0.5,
                  maxScale: 4.0,
                  panEnabled: false,
                  child: Container(
                    height: clockSize,
                    width: clockSize,
                    child: GetBuilder<app_logic_controller>(
                      builder: (controller) => Stack(
                        children: [
                          // Clock face
                          Center(
                            child: Image.asset(
                              "assets/agni.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Hour hand
                          Transform.rotate(
                            angle: (controller.hour_rotation * pi) / 180,
                            child: Center(
                              child: SizedBox(
                                height: handSize,
                                width: handSize,
                                child: Image.asset(
                                  "assets/hourhand.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          // Minute hand
                          Transform.rotate(
                            angle: (double.parse(
                                        "${controller.minutes_rotation}") *
                                    pi) /
                                180,
                            child: Center(
                              child: SizedBox(
                                height: handSize,
                                width: handSize,
                                child: Image.asset(
                                  "assets/minutehand.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          // Second hand
                          Transform.rotate(
                            angle: (double.parse(
                                        "${controller.seconds_rotation}") *
                                    pi) /
                                180,
                            child: Center(
                              child: SizedBox(
                                height: handSize,
                                width: handSize,
                                child: Image.asset(
                                  "assets/sechand.png",
                                  fit: BoxFit.fitHeight,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Agni hand
                          Transform.rotate(
                            angle:
                                (double.parse("${controller.Agni_hand}") * pi) /
                                    180,
                            child: Center(
                              child: SizedBox(
                                height: handSize,
                                width: handSize,
                                child: Image.asset(
                                  "assets/agnihand.png",
                                  fit: BoxFit.fitHeight,
                                  color: !controller.Agni_Present
                                      ? Colors.black54
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          // Agni logo (if present)
                          if (controller.Agni_Present)
                            Transform.translate(
                              offset:
                                  Offset(0, -2.2 * SizeConfig.heightMultiplier),
                              child: Center(
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                    begin: 0,
                                    end: 20 * SizeConfig.widthMultiplier,
                                  ),
                                  duration: const Duration(seconds: 2),
                                  builder: (BuildContext context, double size,
                                      Widget? child) {
                                    return SizedBox(
                                      width: size,
                                      height: size,
                                      child: child,
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/agnilogo512.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Back button at the bottom
            Padding(
              padding: EdgeInsets.only(bottom: 4 * SizeConfig.heightMultiplier),
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: logicController.isDarkMode.value
                      ? Color(0xFF0B3D91)
                      : Color(0xFF0095da),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8 * SizeConfig.widthMultiplier,
                    vertical: 2 * SizeConfig.heightMultiplier,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 2.5 * SizeConfig.textMultiplier,
                    ),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
