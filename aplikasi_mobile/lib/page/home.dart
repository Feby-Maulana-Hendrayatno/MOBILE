// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_final_fields, unused_field

import 'dart:convert';

import 'package:aplikasi_mobile/connection/app_config.dart';
import 'package:aplikasi_mobile/page/home/home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, String? title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://10.0.127.69:8000/api/perumahan/data';
  Future dataPerumahan() async {
    var response =
        await http.get(Uri.parse(AppConfig.getUrl() + 'perumahan/data'));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    dataPerumahan();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Property"),
          backgroundColor: Colors.amber,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  SpUtil.clear();
                  Navigator.pushReplacementNamed(context, "login_page");
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 14, left: 24, right: 24, bottom: 10),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 28,
                        height: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 32,
                            child: Stack(
                              children: [
                                ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    // buildFilter("Rumah"),
                                    // buildFilter("Harga"),
                                    // buildFilter("Keamanan"),
                                    // buildFilter("Kamar Tidur"),
                                    // buildFilter("Kolam Renang"),
                                    SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 28,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            Theme.of(context)
                                                .scaffoldBackgroundColor
                                                .withOpacity(0.0),
                                          ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // _showButtomSheet();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 16, right: 24),
                            child: Text(
                              "Filters",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 24, left: 24, top: 24, bottom: 12),
                    child: Row(
                      children: [
                        Text(
                          "53",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Results found",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 20),
              Container(
                child: Column(children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        viewportFraction: 0.85,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        onPageChanged: (index, carouselReason) {
                          print(index);
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: imgList
                        .map((item) => Container(
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(item,
                                            fit: BoxFit.cover, width: 1000.0),
                                        Positioned(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(200, 0, 0, 0),
                                                  Color.fromARGB(0, 0, 0, 0)
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                            child: Text(
                                              'No. ${imgList.indexOf(item)} image',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 500,
                child: FutureBuilder(
                    future: dataPerumahan(),
                    builder: (context, AsyncSnapshot snapshot) {
                      print(snapshot..data);
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 180,
                                child: Card(
                                  elevation: 15,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          padding: const EdgeInsets.all(5),
                                          height: 140,
                                          width: 200,
                                          child: Image.network(
                                              "http://10.0.127.69:8000/storage/${snapshot.data['data'][index]['foto']}"),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  snapshot.data['data'][index]
                                                      ['nama_perumahan'],
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      snapshot.data['data']
                                                          [index]['uraian'])),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Lokasi " +
                                                      snapshot.data['data']
                                                          [index]['alamat'])),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        // return const Text('Koneksi Jaringan tidak Stabil');
                        return HomeScreen();
                      }
                    }),
              ),
              Container(
                width: double.infinity,
                // height: 200,
                color: Colors.amber,
              ),
            ],
          ),
        ));
  }
}
