import 'dart:html';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    ));

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 50,
        alignment : Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.only(topLeft: Radius.circular(28),
        topRight: Radius.circular(28), 
        ),),
        child: Text(
          "Hubungi Penjual",
          style: TextStyle(
            fontSize: 16,
            fontFamily: "HellixBold",
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}