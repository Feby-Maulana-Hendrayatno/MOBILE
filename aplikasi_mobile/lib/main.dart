import 'package:aplikasi_mobile/page/chat_page.dart';
import 'package:aplikasi_mobile/page/detail_page.dart';
import 'package:aplikasi_mobile/page/home.dart';
import 'package:aplikasi_mobile/auth/register_page.dart';
import 'package:aplikasi_mobile/page/property/property.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/auth/login_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//import '_page.dart';
import 'page/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        'register_page': (context) => RegisterPage(),
        'login_page': (context) => LoginPage(),
        'detail_page': (context) => DetailPage(),
        //'daftar_page': (context) => DaftarPage(),
        'home_page': (context) => HomePage(),
        'chat_page': (context) => ChatPage(),
        'property_page': (context) => PropertyPage(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //yg baru onpresed
      initialRoute: 'login_page',

      // yang lama
      //home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Kelompok 4"),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Saya belajar flutter"),
            SizedBox(
              height: 40,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
