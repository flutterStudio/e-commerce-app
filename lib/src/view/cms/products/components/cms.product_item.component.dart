import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/material.dart';

class CMSProductItem extends StatelessWidget {
  const CMSProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomNetworkImage(
                url: product.mainImage ?? "",
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? "",
                style: const TextStyle(color: Colors.black, fontSize: 16),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary),
                  children: [
                    product.discount != null
                        ? TextSpan(
                            text: " disount: ${product.discount}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary))
                        : const TextSpan(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
