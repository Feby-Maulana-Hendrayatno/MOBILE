// ignore_for_file: unused_field, avoid_print

import 'dart:io';
import 'package:aplikasi_mobile/navigasi_bottom/navigasi.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  late File _file;
  late String _namaFile;
  late String _filePath;
  FilePicker filePicker = FilePicker.platform;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _fileName;
  File? imageBukti;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  final bool _multiPick = false;
  final FileType _pickingType = FileType.any;

  void _ambilFile() async {
    var path = await filePicker.getDirectoryPath();
    var file = await filePicker.pickFiles(
        type: FileType.custom, allowedExtensions: ["pdf", "doc", "docx"]);
    // print(path.runtimeType);
    setState(() {
      _filePath = path.toString();
      _namaFile = path.toString().split("/").last;
      _file = file as File;
    });

    print(_filePath);
    print(_namaFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi Pembayaran"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _ambilFile();
            },
            icon: const Icon(Icons.file_upload),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Silahkan Upload Bukti Pembayaran Di bawah ini",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 97, 78, 84),
              ),
            ),
            const SizedBox(
              height: 30,
              width: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Foto Bukti Pembayaran"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickImageBukti(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            imageBukti == null
                ? const Text("Pilih Gambar")
                : WidgetGmbar(imageFile: imageBukti),
            const SizedBox(
              height: 30,
              width: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Navigasi()));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Berhasil Dikirim')));
                  },
                  child: const Text("Bayar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _pickImageBukti() async {
    _resetState();
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.media);
      if (result != null) {
        File file = File(result.files.single.path!);
        // print(ZZZZzz);
        setState(() {
          imageBukti = file;
        });
      } else {
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

class WidgetGmbar extends StatelessWidget {
  const WidgetGmbar({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 100,
        height: 200,
        child: Image.file(imageFile!, fit: BoxFit.cover),
      ),
    );
  }
}
