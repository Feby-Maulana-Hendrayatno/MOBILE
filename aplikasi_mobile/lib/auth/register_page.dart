// ignore_for_file: unused_import, unused_local_variable, unnecessary_const, avoid_print
import 'dart:convert';
import 'package:aplikasi_mobile/connection/app_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:aplikasi_mobile/auth/login_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

final String url = 'http://192.168.1.15:8000/api/propertys';
static String routeName = "/login";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  // TextEditingController txtTanggalLahir = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
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
                      image: const DecorationImage(
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
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'))),
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
                right: 300,
                top: 1,
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
              Positioned(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 50, top: 580, right: 0, bottom: 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_page');
                    },
                    child: const Text('Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 164, 38))),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 0, top: 580, right: 180, bottom: 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_page');
                    },
                    child: const Text('Sudah Punya Akun',
                        style: TextStyle(color: Color.fromARGB(255, 3, 1, 1))),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    height: 440,
                    width: 340,
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: txtName,
                        decoration: InputDecoration(
                            hintText: "masukan nama lengkap anda",
                            labelText: "Nama Lengkap",
                            icon: const Icon(Icons.people),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            hintStyle: GoogleFonts.oswald(
                                color: const Color.fromARGB(255, 223, 151, 70),
                                fontSize: 14)),
                        autofocus: true,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                            hintText: "masukan email anda",
                            labelText: "Email",
                            icon: const Icon(Icons.message),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            hintStyle: GoogleFonts.oswald(
                                color: const Color.fromARGB(255, 223, 151, 70),
                                fontSize: 14)),
                        autofocus: true,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: txtPassword,
                        decoration: InputDecoration(
                            hintText: "masukan password",
                            labelText: "Password",
                            icon: const Icon(Icons.password_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            hintStyle: GoogleFonts.oswald(
                                color: const Color.fromARGB(255, 223, 151, 70),
                                fontSize: 14)),
                        obscureText: true,
                        autofocus: true,
                      ),
                      // SizedBox(height: 15),
                      // DateTimeField(
                      //     controller: txtTanggalLahir,
                      //     decoration: new InputDecoration(
                      //         hintText: "masukan tanggal lahir anda",
                      //         labelText: "Tgl Lahir",
                      //         icon: Icon(Icons.date_range),
                      //         border: OutlineInputBorder(
                      //             borderRadius: new BorderRadius.circular(8.0)),
                      //         hintStyle: GoogleFonts.oswald(
                      //             color: Color.fromARGB(255, 223, 151, 70),
                      //             fontSize: 14)),
                      //     autofocus: true,
                      //     format: format,
                      //     onShowPicker: (context, currentValue) {
                      //       return showDatePicker(
                      //           context: context,
                      //           firstDate: DateTime(1970),
                      //           initialDate: currentValue ?? DateTime.now(),
                      //           lastDate: DateTime(2100));
                      //     }),
                      const SizedBox(height: 50),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 180.0, top: 18.0, right: 1.0, bottom: 1.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 141, 130, 130)),
                          onPressed: () {
                            _doDaftar();
                          },
                          child: const Text("Register",
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

  Future _doDaftar() async {
    String name = txtName.text;
    String email = txtEmail.text;
    String password = txtPassword.text;
    // String tanggalLahir = txtTanggalLahir.text;
    if (name.isEmpty || email.isEmpty) {
      Alert(
              context: context,
              title: "Data tidak boleh kosong",
              type: AlertType.error)
          .show();
      return;
    }
    // ProgressDialog progressDialog = ProgressDialog(context: context);
    // progressDialog.show(msg: "Loading......", max: 100);
    final response =
        // await http.post(Uri.http('192.168.1.23:8000', 'api/user'), body: {
        await http.post(Uri.parse(AppConfig.getUrl() + 'user'), body: {
      'name': name,
      'email': email,
      'password': password,
      // 'tanggal_lahir': tanggalLahir,
    }, headers: {
      'Accept': 'application/json'
    });

    // progressDialog.close();
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      // var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse['data']['user']['email']);
      Alert(
          context: context,
          title: "Data berhasil disimpan",
          type: AlertType.success,
          buttons: [
            DialogButton(
              child: const Text("INPUT LAGI"),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  txtName.text = "";
                });
              },
            ),
            DialogButton(
              child: const Text("LANJUT LOGIN"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ]).show();
    } else {
      Alert(
              context: context,
              title: "Data Gagal disimpan",
              type: AlertType.error)
          .show();
    }
  }
}
