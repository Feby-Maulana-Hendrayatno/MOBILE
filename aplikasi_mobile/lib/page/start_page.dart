
import 'package:flutter/material.dart';
// import 'package:grouped_buttons/grouped_buttons.dart';
// import 'package:sn_progress_dialog/progress_dialog.dart';


class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartPageState();
}

class _StartPageState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Mulai')),
    );
  }
}
