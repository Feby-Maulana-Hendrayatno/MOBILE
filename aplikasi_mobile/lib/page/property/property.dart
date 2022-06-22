// ignore_for_file: avoid_print, unused_field

import 'dart:convert';

import 'package:aplikasi_mobile/connection/app_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PropertyPage extends StatefulWidget {
  const PropertyPage({Key? key, String? title}) : super(key: key);

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  final String url = 'http://10.0.127.69:8000/api/perumahan/data';
  Future dataPerumahan() async {
    var response = await http.get(Uri.parse(AppConfig.getUrl() + 'perumahan/data'));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProducts(String productId) async {
    String url = 'http://192.168.1.15:8000/api/propertys/' + productId;

    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  final int _current = 0;
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
        // bottomNavigationBar: Theme(
        //   data: Theme.of(context).copyWith(
        //       iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0))),
        //   child: CurvedNavigationBar(
        //     key: navigationKey,
        //     color: Color.fromARGB(255, 46, 161, 255),
        //     buttonBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        //     // backgroundColor: Colors.transparent,
        //     items: items,
        //     height: 60,
        //     animationCurve: Curves.easeInOut,
        //     animationDuration: Duration(milliseconds: 650),
        //     index: index,
        //     onTap: (index) => setState(() => this.index = index),
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const PropertyPage()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Property"),
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder(
            future: dataPerumahan(),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot..data);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height:400,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              GestureDetector(
                                
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  padding: const EdgeInsets.all(5),
                                  height: 220,
                                  width: 220,
                                  child: Image.network(
                                      "http://192.168.1.137:8000/storage/${snapshot.data['data'][index]['foto']}"),
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(snapshot.data['data']
                                              [index]['uraian'])),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Lokasi " + snapshot.data['data']
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
                return const Text('Data Error');
              }
            }));
  }
}