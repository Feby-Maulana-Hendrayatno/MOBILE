import 'package:aplikasi_mobile/model/data_dummy.dart';
import 'package:flutter/material.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SectionTitle(title: "Properti", press: () {}),
        ),
        // SizedBox(height: 20, width: 20),
        Container(
          width: double.infinity,
          height: 250,
          padding: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataProperty.length,
            itemBuilder: ((context, index) => SpecialOfferCard(
                  image: dataProperty[index]['image'][1],
                  typeRumah: dataProperty[index]['type_rumah'],
                  nama: dataProperty[index]['nama_properti'],
                  harga: dataProperty[index]['harga'],
                )),
          ),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.typeRumah,
    required this.image,
    required this.nama,
    required this.harga,
    this.press,
  }) : super(key: key);

  final String? typeRumah, image, nama, harga;

  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 242,
          // height: 0,
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
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: (15),
                      vertical: (20),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "$nama\n",
                            style: TextStyle(
                              backgroundColor: Colors.black.withOpacity(0.2),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "Type Rumah : $typeRumah \n "),
                          TextSpan(text: "Harga : $harga")
                        ],
                      ),
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
