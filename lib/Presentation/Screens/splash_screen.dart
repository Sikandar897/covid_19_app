import 'dart:async';

import 'package:covid_19_app/Presentation/Screens/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  /* it will dispose the controller means just to make sure screen is disconnected with the controller*/
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WorldStatesScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*why animate builder? because i want my logo to be rotate during animation */
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: animationController.value * 2.0 * math.pi,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:
                        Center(child: Image.asset('assets/images/virus.png')),
                  ),
                );
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '  Covid-19\nTracker App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
