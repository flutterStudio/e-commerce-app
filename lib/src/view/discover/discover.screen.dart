import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Discover our products",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
