import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: txtUsername,
                  decoration: InputDecoration(hintText: "Masukan Username"),
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      this._doLogin();
                    },
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10),
                Text("Atau"),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                      onPressed: () {
                        //yg baru
                        Navigator.pushNamed(context, 'daftar_page');

                        //yg lama
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DaftarPage()));
                      },
                      child: Text("Daftar Disini")),
                )
              ]))
        ],
      ),
    );
  }

  Future _doLogin() async {
    // if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
    //   Alert(context: context, title: "Data tidak benar", type: AlertType.error)
    //       .show();
    //   return;
    // }
    // ProgressDialog progressDialog = new ProgressDialog(context);
    // progressDialog.style(message: "Loading......");
    // progressDialog.show();
    final response = await http.post(Uri.http('192.168.1.75:8000', 'api/login'),
        body: {'email': txtUsername.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
    // progressDialog.hide();

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse['data']['user']['email']);
      Alert(context: context, title: "Login Berhasil", type: AlertType.success)
          .show();
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }
}
