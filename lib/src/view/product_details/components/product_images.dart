import 'package:e_commerce/src/model/product.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: widget.product.images!.isEmpty
              ? Text("message-no-product-images".tr)
              : AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: Image.network(
                      widget.product.images![selectedImage],
                      errorBuilder: (context, _, __) => const Icon(Icons.error),
                    ),
                  ),
                ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images?.length ?? 0,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.images![index]),
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
