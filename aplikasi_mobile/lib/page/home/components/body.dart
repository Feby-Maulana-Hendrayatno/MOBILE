import 'package:aplikasi_mobile/page/home/components/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Categories(),
            SpecialOffers(),
            SizedBox(height: 30),
            PopularProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
