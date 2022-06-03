import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aplikasi_mobile/page/welcome/welcome.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'assets/images/3.png',
        duration: 5000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor:  const Color.fromRGBO(201, 123, 44, 1),
        centered: true,
        splashIconSize: double.maxFinite,
        nextScreen : const WelcomePage()
    );
  } 
}
