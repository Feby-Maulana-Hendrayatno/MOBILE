import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget {
  // const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
final String url = 'http://192.168.1.15:8000/api/propertys';

class _ProfilePageState extends State<ProfilePage> {
static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    var profile;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(children: [

      ]),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState),
    );
  }

  CustomBottomNavBar({selectedMenu}) {}
}

class MenuState {
}