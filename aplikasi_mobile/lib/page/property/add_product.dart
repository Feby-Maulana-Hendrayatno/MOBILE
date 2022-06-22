// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:aplikasi_mobile/page/property/property.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  AddProduct({Key? key}) : super(key: key);

  Future saveProduct() async {
    final response = 
    await http.post(Uri.parse("http://192.168.1.15:8000/api/propertys"), 
    body: {
      "name": _nameController.text,
      "description": _descriptionController.text,
      "price": _priceController.text,
      "location": _locationController.text,
      "image": _imageController.text,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product name";
                }
                return null;
              }),
          TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product Description";
                }
                return null;
              }),
          TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: "location"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product Description";
                }
                return null;
              }),
          TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Price"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product Price";
                }
                return null;
              }),
          TextFormField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: "Image"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product Image";
                }
                return null;
              }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  saveProduct().then((value){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PropertyPage(),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Product berhasil di Tambah"),
                    ));
                  });
                  
                }
                // print(__nameController.text);
              },
              child: const Text("Save"))
        ]),
      ),
    );
  }
}
