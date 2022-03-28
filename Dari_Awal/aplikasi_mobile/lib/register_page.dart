import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtTanggalLahir = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    return Scaffold(
      //appBar: AppBar(
        //  title: Text("Halaman Daftar"),
      //),
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
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: new InputDecoration(
                        hintText: "masukan nama lengkap anda",
                        labelText: "Nama Lengkap",
                        icon: Icon(Icons.people),
                        border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                        hintStyle: GoogleFonts.oswald(
                        color: Color.fromARGB(255, 223, 151, 70),
                        fontSize: 14)),
                        autofocus: true,
                      ),

                      TextFormField(
                        decoration: new InputDecoration(
                        hintText: "masukan email anda",
                        labelText: "Email",
                        icon: Icon(Icons.message),
                        border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                        hintStyle: GoogleFonts.oswald(
                        color: Color.fromARGB(255, 223, 151, 70),
                        fontSize: 14)),
                        autofocus: true,
                      ),

                      TextFormField(
                        decoration: new InputDecoration(
                        hintText: "masukan password",
                        labelText: "Pasword",
                        icon: Icon(Icons.password_outlined),
                        border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                        hintStyle: GoogleFonts.oswald(
                        color: Color.fromARGB(255, 223, 151, 70),
                        fontSize: 14)),
                        obscureText: true,
                        autofocus: true,
                      ),

                      DateTimeField(
                    controller: txtTanggalLahir,
                    decoration: new InputDecoration(
                        hintText: "masukan tgl lahir anda",
                        labelText: "Tgl Lahir",
                        icon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                        hintStyle: GoogleFonts.oswald(
                        color: Color.fromARGB(255, 223, 151, 70),
                        fontSize: 14)),
                        autofocus: true,
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1970),
                          initialDate:currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    }),


                      ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            this._doLogin();
                          },
                          child: Text("Daftar Sekarang",
                              style: TextStyle(color: Colors.white)),
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

  Future _doLogin() async {
    String name = txtUsername.text;
    String email = txtEmail.text;
    String password = txtPassword.text;
    String tanggalLahir = txtTanggalLahir.text;
  
    if (txtUsername.text.isEmpty || txtEmail.text.isEmpty) {
      Alert(context: context, title: "Data tidak boleh kosong", type: AlertType.error)
          .show();
      return;
    }
    ProgressDialog progressDialog = new ProgressDialog(context);
    progressDialog.style(message: "Loading......");
    progressDialog.show();
    final response = await http.post(
        Uri.http('192.168.43.29:8000', 'api/register'),
        body: {'name': txtUsername.text,
        'email': txtEmail.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
    progressDialog.hide();

    if (response.statusCode == 201) {
      //var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      //print(jsonResponse['data']['user']['email']);
      Alert(context: context, title: "Data Berhasil Disimpan", type: AlertType.success)
          .show();
    } else {
      Alert(context: context, title: "Data Gagal Disimpan", type: AlertType.error)
          .show();
    }
  }
}
