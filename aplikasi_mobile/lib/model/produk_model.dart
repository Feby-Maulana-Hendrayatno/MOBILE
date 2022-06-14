// To parse this JSON data, do
//
//     final produkModel = produkModelFromJson(jsonString);

import 'dart:convert';

List<ProdukModel> produkModelFromJson(String str) => List<ProdukModel>.from(
    json.decode(str).map((x) => ProdukModel.fromJson(x)));

String produkModelToJson(List<ProdukModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdukModel {
  ProdukModel({
    this.id,
    this.namaProperti,
    this.harga,
    this.typeRumah,
    this.alamat,
    this.image,
  });

  String? id;
  String? namaProperti;
  String? harga;
  String? typeRumah;
  String? alamat;
  List<String>? image;

  factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
        id: json["id"],
        namaProperti: json["nama_properti"],
        harga: json["harga"],
        typeRumah: json["type_rumah"],
        alamat: json["alamat"],
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_properti": namaProperti,
        "harga": harga,
        "type_rumah": typeRumah,
        "alamat": alamat,
        "image": List<dynamic>.from(image!.map((x) => x)),
      };
}
