import 'package:aplikasi_mobile/page/buyer/profile_settings.dart';
import 'package:aplikasi_mobile/page/home.dart';
import 'package:aplikasi_mobile/page/syarat/add_syarat.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../page/syarat/add_syarat.dart';

class Navigasi extends StatefulWidget {
  const Navigasi({Key? key}) : super(key: key);

  @override
  State<Navigasi> createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int? index = 0;
  final screens = [
    HomePage(),
    // DetailPage(property: ,),
    // ChatPage(),
    // Search(),
    // PropertyPage(),
    // FileUpload(),
    // DashboardPage(),
    //ProfilePage(),
    const Syarat(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      // Icon(Icons.search, size: 30),
      const Icon(Icons.assignment_sharp, size: 30),

      // Icon(Icons.settings, size: 30),
      const Icon(Icons.person, size: 30),
    ];
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 255, 255, 255))),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.brown.shade200,
            buttonBackgroundColor: const Color.fromARGB(255, 141, 130, 130),
            backgroundColor: Colors.transparent,
            // backgroundColor: Color.fromARGB(255, 255, 255, 255),
            items: items,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 650),
            index: index!,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
        body: screens[index!]);
  }
}
