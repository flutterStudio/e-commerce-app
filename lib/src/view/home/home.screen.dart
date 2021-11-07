import 'package:e_commerce/src/view/sales/sales.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/cart");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.shopping_bag,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              {
                Get.toNamed("/");
                break;
              }
            case 1:
              {
                Get.toNamed("/products");
                break;
              }
            case 2:
              {
                Get.toNamed("/cart");
                break;
              }
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_rounded),
            label: "Sales",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits),
              label: "Our Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "Cart"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: PageView(
            children: const [SalesScreen()],
          ),
        ),
      ),
    );
  }
}
