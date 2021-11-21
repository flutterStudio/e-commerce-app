import 'package:e_commerce/src/view/shared/search_field/category_card.widget.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Map<String, dynamic>> categories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryCard(
            isActive: index == 2,
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}
