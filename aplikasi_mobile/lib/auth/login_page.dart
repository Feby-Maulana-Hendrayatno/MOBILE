// ignore_for_file: non_constant_identifier_names
import 'package:aplikasi_mobile/connection/app_config.dart';
import 'package:aplikasi_mobile/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtUsername = TextEditingController();

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  Future _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data tidak benar", type: AlertType.error)
          .show();
      return;
    }
    // ProgressDialog progressDialog = ProgressDialog(context: context);
    // progressDialog.show(msg: "Loading......", max: 100);
    final response = await http.post(Uri.parse(AppConfig.getUrl() + 'login'), body: {
      'email': txtUsername.text,
      'password': txtPassword.text,
    }, headers: {
      'Accept': 'application/json'
    });
    // progressDialog.close();

    if (response.statusCode == 200) {
      // var responseDecode = jsonDecode(response.body);
      //   bool success = responseDecode['success'];
      //   var data = responseDecode['data'];
      //   var user = responseDecode['user'];
      //   var token = responseDecode['token'];
      //   print(user);
      // final loginModel = loginModelFromJson(response.body);
      // print(loginModel.data.user.email);
      // print(loginModel.data.user.token);
      // SpUtil.putBool('isLogin', true);
      // Navigator.pushReplacementNamed(context, 'home_page');

      final loginModel = loginModelFromJson(response.body);
      var token = loginModel.data.user.token; // route dari json array nya
      SpUtil.putString("token", token);
      SpUtil.putString("name", loginModel.data.user.name);
      SpUtil.putBool('isLogin', true);
      Alert(
          context: context,
          title: "Login Berhasil",
          type: AlertType.success,
          buttons: [
            DialogButton(
              child: const Text("Ok"),
              onPressed: () {
      // Navigator.pushReplacementNamed(context, 'navigasi_page');
        Navigator.pushNamed(context, 'navigasi_page');
          },
        )
      ]).show();
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                  decoration: const BoxDecoration(
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
                  decoration: const BoxDecoration(
                      // ignore: unnecessary_const
                      image: const DecorationImage(
                          image: AssetImage('assets/images/light-2.png'))),
                ),
              ),
              Positioned(
                right: 300,
                top: 10,
                width: 80,
                height: 170,
                child: Container(
                  decoration: const BoxDecoration(
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'))),
                ),
              ),
              const Positioned(
                right: 100,
                top: 40,
                width: 300,
                height: 350,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromRGBO(201, 123, 44, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: 210,
                top: 0,
                width: 140,
                height: 1060,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'))),
                ),
              ),
              Positioned(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 20, top: 580, right: 0, bottom: 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'navigasi_page');
                    },
                    child: const Text('Daftar',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 164, 38))),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 0, top: 580, right: 200, bottom: 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'register_page');
                    },
                    child: const Text('Tidak Punya Akun',
                        style: TextStyle(color: Color.fromARGB(255, 3, 1, 1))),
                  ),
                ),
              ),
              Positioned(
                  top: 290,
                  // bottom: 10,
                  left: 10,
                  child: SizedBox(
                    // padding: EdgeInsets.all(18),
                    width: 340,
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: txtUsername,
                        decoration: InputDecoration(
                            hintText: "masukan alamat email anda",
                            labelText: "Nama Email",
                            icon: const Icon(Icons.people),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            hintStyle: GoogleFonts.oswald(
                                color: const Color.fromARGB(255, 223, 151, 70),
                                fontSize: 14)),
                        autofocus: true,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: txtPassword,
                        decoration: InputDecoration(
                            hintText: "masukan password",
                            labelText: "Pasword",
                            icon: const Icon(Icons.password_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            hintStyle: GoogleFonts.oswald(
                                color: const Color.fromARGB(255, 223, 151, 70),
                                fontSize: 14)),
                        obscureText: true,
                        autofocus: true,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 220.0, top: 80, right: 1.0, bottom: 1.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 141, 130, 130)),
                          onPressed: () {
                            _doLogin();
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )),
                        ),
                      ),
                    ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
