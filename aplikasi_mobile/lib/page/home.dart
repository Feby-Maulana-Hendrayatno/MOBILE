import 'dart:convert';

import 'package:aplikasi_mobile/connection/app_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key, String? title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getProducts() async {
    final response = await http.get(Uri.parse(AppConfig.getUrl()+);
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProducts(String productId) async {
    String url = 'http://192.168.1.137:8000/api/propertys/' + productId;

    var response = await http.delete(Uri.parse(url));
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
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30),
    ];
    getProducts();
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
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Property"),
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder(
            future: getProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot..data);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 180,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => HomePage(
                                //                 product: snapshot.data['data']
                                //                     [index],
                                //               )));
                                // },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  padding: EdgeInsets.all(5),
                                  height: 120,
                                  width: 120,
                                  child: Image.network(
                                      "http://192.168.1.137:8000/storage/${snapshot.data['data'][index]['foto']}"),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          snapshot.data['data'][index]
                                              ['nama_perumahan'],
                                          style: TextStyle(
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
                                          child: Text(snapshot.data['data']
                                              [index]['alamat'])),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                // onTap: () {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             EditProduct(
                                                //           product: snapshot
                                                //                   .data['data']
                                                //               [index],
                                                //         ),
                                                //       ));
                                                // },
                                                child: Icon(
                                                  Icons.edit,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  deleteProducts(snapshot
                                                          .data['data'][index]
                                                              ['id']
                                                          .toString())
                                                      .then((value) {
                                                    setState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Product berhasil di Hapus"),
                                                    ));
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                return Text('Data Error');
              }
            }));
  }
}
