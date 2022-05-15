import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text("Login"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('assets/images/welcome.png', ),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                right: 105,
                top: 0,
                width: 200,
                height: 730,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/nama_aplikasi.png', ))),
                ),
              ),
              Positioned(
                right: 105,
                top: 0,
                width: 200,
                height: 990,
                child: Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_page');
                    },
                    child: const Text('Get Started',
                        style: TextStyle(
                            color: Color.fromARGB(213, 116, 113, 94))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}