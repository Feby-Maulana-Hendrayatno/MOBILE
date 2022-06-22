// ignore_for_file: unused_import, override_on_non_overriding_member, unused_field, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'profile_page.dart';
import 'package:aplikasi_mobile/page/buyer/profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override

final String url = 'http://192.168.1.15:8000/api/propertys';
static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 1,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.brown[300],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.brown[200],
      leading: IconButton(icon: const Icon(Icons.arrow_back),
      onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child:Column(
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    width: 115,
                    height:115,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/profile.png'),
                        ),
                    ),
                  ),
            // Divider(
            //   height: 180,
            //   thickness: 2,
            // ),
          
            // SizedBox(
            //   height: 100,
            // ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.person,
            //       color: Colors.brown[200],
            //     ),
            //     SizedBox(
            //       width: 80,
            //     ),
            //     Text(
            //       "Account",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // buildAccountOptionRow(context, "Change password"),
            // buildAccountOptionRow(context, "Content settings"),
            // buildAccountOptionRow(context, "Privacy and security"),
            // SizedBox(
            //   height: 40,
            // ),
                        
            // Row(
            //   children: [
            //     Icon(
            //       Icons.volume_up_outlined,
            //       color: Colors.brown[300],
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(
            //       "Notifications",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // buildNotificationOptionRow("New for you", true),
            // buildNotificationOptionRow("Account activity", true),
            // buildNotificationOptionRow("Opportunity", false),
            // SizedBox(
            //   height: 50,
            // ),
          

          ],
        ),
          const Text(
              "User",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
              ElevatedButton(
                style: 
                ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 141, 130, 130)),
                  onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage() ));
              },child: const Text("Edit")),
            Center(
              child: OutlineButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: const Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 13, letterSpacing: 2.2, color: Colors.black)),
              ),
            ),
        ],
        ),
    ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  
  OutlineButton({required EdgeInsets padding, required RoundedRectangleBorder shape, required Null Function() onPressed, required Text child}) {}
}