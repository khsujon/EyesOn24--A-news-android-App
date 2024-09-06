import 'dart:async';

import 'package:eyeson24/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade200,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/banner.png",
                    fit: BoxFit.cover,
                    height: height * 0.45,
                  ),
                  Positioned(
                    bottom: -130,
                    right: 80,
                    child: Lottie.asset("assets/annimations/annimate.json",
                        height: height * 0.50, width: width * 0.50),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                'Here we go....',
                style: GoogleFonts.goblinOne(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              SpinKitChasingDots(
                color: Colors.white70,
                size: 30,
              ),
            ],
          )),
    );
  }
}
