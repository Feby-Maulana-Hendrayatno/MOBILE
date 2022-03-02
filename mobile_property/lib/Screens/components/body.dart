// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_property/Screens/components/background.dart';
import 'package:mobile_property/Screens/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total heigh and width of our screen
    var kPrimaryLightColor2 = kPrimaryLightColor;
    var kPrimaryLightColor;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome To Property", 
              style:TextStyle(fontWeight : FontWeight.bold),
            ),
          SizedBox(height: size.height * 0.03), 
          SvgPicture.asset(
            "assets/icons/chat.svg", 
            height: size.height*0.45,
          ), 
          SizedBox(height: size.height * 0.05), 
            // Container(
            //   width: size.width * 0.8,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(29),
            //     child: FlatButton(
            //       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            //       color: kPrimaryColor,
            //       onPressed:(){}, 
            //       child: Text("LOGIN", style:TextStyle(color: Colors.white)), 
            //           ),
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),  
          RoundedButton(
            text: "LOGIN",
            press: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: "LOGIN",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {},
          ),
        ],
        ),
      ),
    );
  }
}

