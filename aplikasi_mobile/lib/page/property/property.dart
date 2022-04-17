import 'dart:convert';

import 'package:aplikasi_mobile/page/property/add_product.dart';
import 'package:aplikasi_mobile/page/property/detail_property.dart';
import 'package:aplikasi_mobile/page/property/edit_proprty.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PropertyPage extends StatefulWidget {
  const PropertyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  final String url = 'http://192.168.1.15:8000/api/propertys';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProducts(String productId) async {
    String url = 'http://192.168.1.15:8000/api/propertys/' + productId;

    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Prperty"),
        ),
        body: FutureBuilder(
            future: getProducts(),
            builder: (context, AsyncSnapshot snapshot) {
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                                product: snapshot.data['data']
                                                    [index],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  padding: EdgeInsets.all(5),
                                  height: 120,
                                  width: 120,
                                  child: Image.network(
                                      snapshot.data['data'][index]['image']),
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
                                          snapshot.data['data'][index]['name'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(snapshot.data['data']
                                              [index]['description'])),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(snapshot.data['data']
                                              [index]['location'])),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProduct(
                                                          product: snapshot
                                                                  .data['data']
                                                              [index],
                                                        ),
                                                      ));
                                                },
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
                                                        setState(() {
                                                          
                                                        });
                                                        ScaffoldMessenger.of(context)
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
                                          Text(snapshot.data['data'][index]
                                              ['price']),
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
