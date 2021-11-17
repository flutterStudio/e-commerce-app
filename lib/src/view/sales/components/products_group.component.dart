import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:flutter/material.dart';

class ProductsGroup extends StatelessWidget {
  final List<Product> items;

  const ProductsGroup({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) => ProductCard(product: items[index]))
        : Container();
  }
}
