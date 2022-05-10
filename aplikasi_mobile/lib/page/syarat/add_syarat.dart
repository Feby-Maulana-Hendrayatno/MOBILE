import 'dart:convert';

import 'package:aplikasi_mobile/page/property/property.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddSyarat extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _fileController = new TextEditingController();

  Future saveProduct() async {
    final response = await http
        .post(Uri.parse("http://192.168.1.15:8000/api/propertys"), body: {
      "name": _nameController.text,
      "file": _fileController.text,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Syarat'),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              }),
          TextFormField(
              controller: _fileController,
              decoration: InputDecoration(labelText: "File"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Link File";
                }
                return null;
              }),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  saveProduct().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PropertyPage(),
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Syarat berhasil di Tambah"),
                    ));
                  });
                }
                // print(__nameController.text);
              },
              child: Text("Save"))
        ]),
      ),
    );
  }
}
