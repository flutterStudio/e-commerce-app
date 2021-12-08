import '../products/cms.products.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CMSHome extends StatelessWidget {
  const CMSHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Text("CMS")),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      title: Text("Products"),
                    ),
                    ListTile(
                      title: Text("Sizes"),
                    ),
                    ListTile(
                      title: Text("Colors"),
                    ),
                    ListTile(
                      title: Text("Atatchments"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: PageView(
          children: const [CMSProducts()],
        ));
  }
}
