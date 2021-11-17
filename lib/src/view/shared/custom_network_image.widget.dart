import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final Widget? erroPlaceholder;

  const CustomNetworkImage({Key? key, required this.url, this.erroPlaceholder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      errorBuilder: (context, _, __) =>
          erroPlaceholder ?? const Icon(Icons.error),
    );
  }
}
