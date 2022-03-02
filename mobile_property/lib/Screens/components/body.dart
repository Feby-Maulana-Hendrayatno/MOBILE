import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total heigh and width of our screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome To Property", 
            style:TextStyle(fontWeight : FontWeight.bold),
          ), 
        SvgPicture.asset(
          "assets/icons/chat.svg", 
          height: size.height*0.45,
        ), 
        RoundedButton(),
      ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key, 
    this.text, 
    this.press, 
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: kPrimaryColor,
            onPressed: () {}, 
            child: Text(
              text,
              style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}