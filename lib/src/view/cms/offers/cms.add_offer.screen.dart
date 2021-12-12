import 'package:e_commerce/src/view/cms/offers/components/add_offer_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CMSAddOfferScreen extends StatelessWidget {
  const CMSAddOfferScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add-offer".tr),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "add-offer".tr,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                const AddOfferForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
