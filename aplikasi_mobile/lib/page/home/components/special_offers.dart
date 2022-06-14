import 'dart:convert';

import 'package:aplikasi_mobile/model/data_dummy.dart';
import 'package:aplikasi_mobile/model/produk_model.dart';
import 'package:aplikasi_mobile/page/home/components/size_config.dart';
import 'package:flutter/material.dart';

import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataProperty.length,
            itemBuilder: (context, index) {
              print(dataProperty[index]);
              return SpecialOfferCard(
                nama: dataProperty[index]['nama_properti'],
                typeRumah: dataProperty[index]['type_property'],
                image: dataProperty[index]['image'][2],
              );
            },
          ),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  SpecialOfferCard({
    // this.produkModel,
    this.typeRumah,
    this.image,
    this.nama,
    Key? key,
  }) : super(key: key);
  String? nama;
  String? typeRumah;
  String? image;
  // ProdukModel? produkModel;
  GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 240,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: typeRumah,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: nama)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
