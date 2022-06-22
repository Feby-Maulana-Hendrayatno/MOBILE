import 'package:aplikasi_mobile/navigasi_bottom/navigasi.dart';
import 'package:aplikasi_mobile/page/buyer/profile_settings.dart';
import 'package:aplikasi_mobile/page/chat_page.dart';
import 'package:aplikasi_mobile/page/dahboard.dart';
import 'package:aplikasi_mobile/page/detail_page.dart';
import 'package:aplikasi_mobile/page/home.dart';
import 'package:aplikasi_mobile/auth/register_page.dart';
import 'package:aplikasi_mobile/page/home/home_screen.dart';
import 'package:aplikasi_mobile/page/icon/search.dart';
import 'package:aplikasi_mobile/page/property/property.dart';
import 'package:aplikasi_mobile/page/syarat/add_syarat.dart';
import 'package:aplikasi_mobile/page/welcome/welcome.dart';
import 'package:aplikasi_mobile/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/auth/login_page.dart';
import 'package:sp_util/sp_util.dart';


// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        'register_page': (context) => const RegisterPage(),
        'login_page': (context) => const LoginPage(),
        'detail_page': (context) => const DetailPage(),
        //'daftar_page': (context) => DaftarPage(),
        'home_page': (context) => HomePage(),
        'home_screen': (context) => const HomeScreen(),
        'chat_page': (context) => const ChatPage(),
        'property_page': (context) => const PropertyPage(),
        'navigasi_page': (context) => const Navigasi(),
        // "profile_page": (context) => ProfilePage(),
        "profile_settings": (context) => const SettingsPage(),
        "welcome_page": (context) => const WelcomePage(),
        'splash_page': (context) => const Splash(),
        "dashboard_page": (context) => DashboardPage(),
        "search_page": (context) => const Search(),
        "add_syarat": (context) => const Syarat(),
        // "syarat_page": (context) => FileUpload(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //yg baru onpresed

      initialRoute:
          (SpUtil.getBool("isLogin")!) ? 'navigasi_page' : 'splash_page',
      // initialRoute: 'home_page',

      // home: AnimatedSplashScreen(
      //   splash: 'assets/images/3.png',
      //   duration: 2000,
      //   splashTransition: SplashTransition.scaleTransition,
      //   backgroundColor: Colors.blue,
      //   nextScreen : HomePage(title: 'Welcome')),
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
  final _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Kelompok 4"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Saya belajar flutter"),
            const SizedBox(
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