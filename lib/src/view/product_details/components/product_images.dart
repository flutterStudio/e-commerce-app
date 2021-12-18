import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/material.dart';

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
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: CustomNetworkImage(
                url: widget.product.allImages()[selectedImage],
              ),
            ),
          ),
        ),
        const SizedBox(height: SizeConfig.verticalSpace),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.allImages().length,
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
        child: CustomNetworkImage(
          url: widget.product.allImages()[index],
        ),
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
