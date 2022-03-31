import 'dart:convert';

import 'package:aplikasi_mobile/connection/app_config.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'daftar_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

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
                          image: AssetImage('assets/images/a.png'),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                right: 210,
                top: 0,
                width: 90,
                height: 130,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'))),
                ),
              ),
              Positioned(
                right: 300,
                top: 1,
                width: 80,
                height: 170,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'))),
                ),
              ),
              Positioned(
                right: 40,
                top: 40,
                width: 80,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'))),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 360,
                    width: 350,
                    // color: Colors.white,
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: txtUsername,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Masukan Username",
                            hintStyle: GoogleFonts.oswald(
                                color: Color.fromARGB(255, 0, 0, 0),
                                // fontWeight: FontWeight.bold,
                                // height: 5,
                                fontSize: 20)),
                      ),
                      TextFormField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Masukan Password",
                            hintStyle: GoogleFonts.oswald(
                                color: Color.fromARGB(255, 0, 0, 0),
                                // fontWeight: FontWeight.bold,
                                // height: 5,
                                fontSize: 20)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 54, 73, 244)),
                        onPressed: () {
                          this._doLogin();
                        },
                        child: Text("Login",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text("Atau"),
                      ButtonTheme(
                        child: RaisedButton(
                            onPressed: () {
                              //yg baru
                              Navigator.pushNamed(context, 'register_page');
                              // Navigator.pushNamed(context, 'home_page');

                              //yg lama
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => DaftarPage()));
                            },
                            child: Text(
                              "Daftar Disini",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data tidak benar", type: AlertType.error)
          .show();
      return;
    }
    ProgressDialog progressDialog = new ProgressDialog(context);
    progressDialog.style(message: "Loading......");
    progressDialog.show();
    //VERSI LAMA BRO
    // final response = await http.post(
    //     Uri.http('192.168.1.11:8000', 'api/login'),
    //     body: {'email': txtUsername.text, 'password': txtPassword.text},
    //     headers: {'Accept': 'application/json'});
    final response =
        // await http.post(Uri.http('192.168.1.23:8000', 'api/user'), body: {
        await http.post(Uri.parse(AppConfig.getUrl() + 'login'), body: {
      'email': txtUsername.text,
      'password': txtPassword.text,
    }, headers: {
      'Accept': 'application/json'
    });
    progressDialog.hide();

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse['data']['user']['email']);
      // Alert(context: context, title: "Login Berhasil", type: AlertType.success)
      //     .show();

      Alert(
          context: context,
          title: "Login Berhasil",
          type: AlertType.success,
          buttons: [
            DialogButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pushNamed(context, 'home_page');
              },
            )
          ]).show();
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }
}
