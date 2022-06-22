import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoriesIndex = 0;

  Widget _buildCategories(BuildContext context, int index) {

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoriesIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 30 / 3),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
          decoration: BoxDecoration(
              color: selectedCategoriesIndex == index
                  ? const Color.fromARGB(255, 13, 44, 70)
                  : Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),),
          child: Center(
            child: Text(
              "Categories",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedCategoriesIndex == index ? Colors.white : Colors.black
            ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        top: 30 / 2,
        bottom: 15,
      ),
      child: SizedBox(
        height: size.height * 0.05,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return _buildCategories(context, index);
          },
        ),
      ),
    );
  }
}
