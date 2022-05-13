import 'dart:io';
// import 'package:coba/theme/colors.dart';
import 'package:aplikasi_mobile/widget/syarat_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:coba/screens/home_page.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({Key? key}) : super(key: key);

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  late File _file;
  late String _namaFile;
  late String _filePath;
  FilePicker filePicker = FilePicker.platform;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _fileName;
  File? imageKtp;
  File? imageWarna;
  File? imageKk;
  File? imageRekening;
  File? imageNpwp;
  File? imageSiup;
  File? karyawan;
  File? gaji;
  File? pegawai;
  File? sk;
  File? nikah;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;

  void _ambilFile() async {
    var path = await filePicker.getDirectoryPath();
    var file = await filePicker.pickFiles(
        type: FileType.custom, allowedExtensions: ["pdf", "doc", "docx"]);

    setState(() {
      _filePath = path.toString();
      _namaFile = path.toString().split("/").last;
      _file = file as File;
    });

    print(_filePath);
    print(_namaFile);
  }

  // void _uploadFile(File file) async {
  //   var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
  //   var length = file.length();
  //   var url = Uri.parse('http://10.5.50.224/api/syarat');

  //   var request = http.MultipartRequest("POST", url);
  //   var multipartFile = http.MultipartFile.fromPath("dokumen", file.path);

  //   request.files.add(multipartFile);
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     print("File berhasil diupload");
  //   } else {
  //     print("File gagal diupload");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir Syarat"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _ambilFile();
            },
            icon: Icon(Icons.file_upload),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "Silahkan Isi Formulir Terlebih Dahulu",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 97, 78, 84)),
            ),

            TextFieldSyarat(
                hintText: "Nama Lengkap", textInputType: TextInputType.text),
            // TextFieldSyarat(
            //     hintText: "Nomor KTP", textInputType: TextInputType.text),
            // TextFieldSyarat(
            //     hintText: "Alamat Rumah Huni Sekarang",
            //     textInputType: TextInputType.text),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Surat Keterangan Karyawan"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickFiles(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih File'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Surat Legalisir Penghasilan (Slip Gaji)"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickFiles(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih File'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Surat Legalisir Kartu Pegawai"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickFiles(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih File'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Surat Legalisir SK Pertama dan Terakhir"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickFiles(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih File'),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto Berwarna Suami dan Istri"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto KTP"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto Surat Nikah"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto Kartu Keluarga"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto Rekening Tabungan (Min 4 Bulan)"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto SIUP dan TDP Perusahaan"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Foto NPWP Pribadi"),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 181, 149, 137))),
                  onPressed: () => _pickGambar(),
                  child: Text(_multiPick ? 'Pilih Gambars' : 'Pilih Gambar'),
                ),
              ],
            ),

            // _namaFile == null
            //     ? Text("Lampirkan Surat NPWP : ")
            //     : Text("Surat NPWP : $_namaFile "),
            // SizedBox(height: 15),
            // _filePath == null
            //     ? Text("Lampirkan Surat NPWP : ")
            //     : Text("Surat NPWP : $_filePath "),
            // SizedBox(
            //   height: 15,
            // ),
            // OutlineButton(
            //   child: Text("Upload File"),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }

  void _pickFiles() async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowMultiple: _multiPick,
              onFileLoading: (FilePickerStatus status) => print(status),
              allowedExtensions: ["pdf"]))
          ?.files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  void _pickGambar() async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.media,
        allowMultiple: _multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
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
