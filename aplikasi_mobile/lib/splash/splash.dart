import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aplikasi_mobile/auth/login_page.dart';
import 'package:aplikasi_mobile/navigasi_bottom/navigasi.dart';
import 'package:aplikasi_mobile/page/home.dart';
import 'package:aplikasi_mobile/page/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    autoDashboard();
  }

  autoDashboard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      if (val != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      }
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'assets/images/3.png',
        duration: 5000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor:  Color.fromRGBO(201, 123, 44, 1),
        centered: true,
        splashIconSize: double.maxFinite,
        nextScreen : WelcomePage()
    );
  }

    
}
