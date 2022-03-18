// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

class DaftarPage extends StatefulWidget {
  DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtJenisKelamin = new TextEditingController();
  TextEditingController txtTanggalLahir = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Daftar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text("Pendaftaran"),
                TextFormField(
                  controller: txtName,
                  decoration: InputDecoration(hintText: "Masukkan Nama"),
                ),
                TextFormField(
                  controller: txtEmail,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller: txtPassword,
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                //   RadioButtonGroup(
                // labels: <String>[
                //   "laki - Laki",
                //   "Perempuan",
                // ],
                // onSelected: (String selected) {
                //   txtJenisKelamin.text = selected;
                // }),
                DateTimeField(
                    controller: txtTanggalLahir,
                    decoration: InputDecoration(labelText: "Tanggal Lahir"),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1970),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    }),

                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    child: Text("Daftar Sekarang",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      _doDaftar();
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _doDaftar() async {
    String name = txtName.text;
    String email = txtEmail.text;
    String password = txtPassword.text;
    String tanggalLahir = txtTanggalLahir.text;
    if (name.isEmpty || email.isEmpty) {
      Alert(
              context: context,
              title: "Data tidak boleh kosong",
              type: AlertType.error)
          .show();
      return;
    }
    ProgressDialog progressDialog = new ProgressDialog(context);
    progressDialog.style(message: "Loading......");
    progressDialog.show();
    final response = await http.post(Uri.http('192.168.1.75:8000', 'api/user'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'tanggalLahir' : tanggalLahir,
          },
        headers: {'Accept': 'application/json'});
    progressDialog.hide();

    if (response.statusCode == 201) {
      // var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse['data']['user']['email']);
      Alert(context: context, title: "Data berhasil disimpan", type: AlertType.success)
          .show();
    } else {
        Alert(context: context, title: "Data Gagal disimpan", type: AlertType.error)
          .show();
    }
  }
}
