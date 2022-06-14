import 'dart:convert';

import 'package:aplikasi_mobile/model/produk_model.dart';

List<Map<String, dynamic>> dataProperty = [
  {
    "id": "1",
    "nama_properti": "Rumah Balongan",
    "harga": "130.000.000",
    "type_rumah": "Tipe 36",
    "alamat": "Indramayu",
    "image": [
      "assets/images/3.jpg",
      "assets/images/1.jpg",
      "assets/images/2.jpg",
    ],
  },
  {
    "id": "2",
    "nama_properti": "Balongan Asri",
    "harga": "230.000.000",
    "type_rumah": "Tipe 45",
    "alamat": "Indramayu",
    "image": [
      "assets/images/1.jpg",
      "assets/images/3.jpg",
      "assets/images/2.jpg",
    ],
  }
];


// Future<List<ProdukModel> listProduk ()async {
//   List<ProdukModel> data =[];

//   for (var i = 0; i < dataProperty.length; i++) {
//     var json =jsonEncode(dataProperty[i]);
//     var hasil = jsonDecode(json);

//     // data.add(produkModelFromJson(hasil));
    
//   }



