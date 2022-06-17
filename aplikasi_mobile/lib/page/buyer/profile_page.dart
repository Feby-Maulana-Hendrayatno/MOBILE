import 'dart:convert';
import 'package:aplikasi_mobile/page/buyer/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {

final String url = 'http://192.168.1.15:8000/api/propertys';
static String routeName = "/profile";


  get txtName => null;
  get txtEmail => null;
  get txtPassword => null;

  Widget textfield({required String hintText}){
    return Material(
      elevation: 2,
      shadowColor: Colors.brown[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
          child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 1.5,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.brown[200],
      leading: IconButton(icon: Icon(Icons.arrow_back),
      onPressed: () {},
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
              padding: EdgeInsets.all(2),
              child: Text(
              "Profile",
              style: TextStyle(
              fontSize: 35,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              ),
              ),
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    width: 115,
                    height:115,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/profile.png'),
                        ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right:0,
                    child: Padding(padding: EdgeInsets.only(bottom: 10, left: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  ),
                                ),
                            ),
                            ),
                  ),
                ],
              ),
            ],
          ),
          
              Container(
                height: 330,
                width: 350,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                          controller: txtName,
                          decoration: new InputDecoration(
                              hintText: "masukan nama lengkap anda",
                              labelText: "Nama Lengkap",
                              icon: Icon(Icons.people),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              hintStyle: GoogleFonts.oswald(
                                  color: Color.fromARGB(255, 223, 151, 70),
                                  fontSize: 12)),
                          autofocus: true,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: txtEmail,
                          decoration: new InputDecoration(
                              hintText: "masukan email anda",
                              labelText: "Email",
                              icon: Icon(Icons.message),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              hintStyle: GoogleFonts.oswald(
                                  color: Color.fromARGB(255, 223, 151, 70),
                                  fontSize: 12)),
                          autofocus: true,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: txtPassword,
                          decoration: new InputDecoration(
                              hintText: "masukan password",
                              labelText: "Password",
                              icon: Icon(Icons.password_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              hintStyle: GoogleFonts.oswald(
                                  color: Color.fromARGB(255, 223, 151, 70),
                                  fontSize: 12)),
                          obscureText: true,
                          autofocus: true,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: txtPassword,
                          decoration: new InputDecoration(
                              hintText: "konfirmasi password",
                              labelText: "Confirm Password",
                              icon: Icon(Icons.password_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              hintStyle: GoogleFonts.oswald(
                                  color: Color.fromARGB(255, 223, 151, 70),
                                  fontSize: 12)),
                          obscureText: true,
                          autofocus: true,
                        ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                        },
                      color: Color.fromARGB(255, 141, 130, 130),
                        child: Center(
                          child: Text("Update", style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ],
        ),
      )
    );
  }
}

class HeaderCurvedContainer extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint= Paint()..color=Colors.brown.shade200;
    Path path= Path()
    ..relativeLineTo(0, 100)
    ..quadraticBezierTo(size.width/2, 200, size.width, 100)
    ..relativeLineTo(0, -110)
    ..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}
