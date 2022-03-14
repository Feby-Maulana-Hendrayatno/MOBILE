import 'package:flutter/material.dart';

class DaftarPage extends StatefulWidget {
  DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text("Halaman Daftar"),
      )
    );
  }
}
