import 'package:e_commerce/src/view/shared/search_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NestedScrollView(
            body: Container(),
            headerSliverBuilder: (context, _) =>
                const [Hero(tag: "search-field", child: SearchField())]),
      ),
    );
  }
}
