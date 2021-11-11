import 'dart:convert';

import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductRepo {
  final ApiService _apiService;

  static const String activeProductsUrl = "Product/activeProduc";
  ProductRepo({required ApiService apiService}) : _apiService = apiService {
    getActiveProducts();
  }

  Future<Product?> getActiveProducts() async {
    _apiService.getRequest<List<Product>>(
        "Product/activeProduct?page=1&pageSize=10", (response) {
      var productsData = jsonDecode(response.bodyString!)["products"] as List;
      List<Product> products = [];
      for (var product in productsData) {
        products.add(Product().serilizer().fromJson(product));
      }
      return products;
    });
  }

  List<Product> demoProducts = [
    Product(
      id: 1,
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Nike Sport White - Man Pant",
      price: 50.5,
      description: description,
      rating: 4.1,
      isPopular: true,
    ),
    Product(
      id: 3,
      images: [
        "assets/images/glap.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Gloves XC Omega - Polygon",
      price: 36.55,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 4,
      images: [
        "assets/images/wireless headset.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Logitech Head",
      price: 20.20,
      description: description,
      rating: 4.1,
      isFavourite: true,
    ),
    // backbags 5->8
    Product(
      id: 5,
      images: [
        "assets/images/backbag1.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "XQXA Travel backpack, 45L large capacity waterproof hiking backpack 17.3 inch laptop backpack male female trekking backpack for sports outdoor camping camping",
      price: 35.99,
      description: """
    CONVENIENT USB & HEADSET PORT DESIGN:USB interface with built-in cable design,great convenience for charging your electronic devices by connecting your own power bank. Jack design for listening music helps you relax yourself while travelling.
Anti-theft design: travel backpack with hidden anti-theft pocket on the back protects your passport, wallet, phone and other valuable items safe and convenient. No need to worry theft easily open your backpack when you travel or stand in line.
DURABLE MATERIAL:This travel laptop backpack is made of high quality tear and abrasion resistant and rainproof slightly thicker ox-forward material, delivers long-lasting durability against daily activities. Breathable mesh shoulder straps with plentiful sponge padding help relieve the stress from your shoulder. """,
      rating: 4,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 6,
      images: [
        "assets/images/backbag2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "Vintage Laptop Backpack 15.6 Inch for Men/Women, Bag for School/Work/Travel ",
      price: 16,
      description: """
    Material: waterproof polyester fabric, protects the items from drizzle.
    Excellent gifts for women/men back to school, work, business, weekend getaways, travel, etc.
    Dimension:11.8 * 6.7 * 17.7 inch (L * W * H), The main compartment has a padded laptop sleeve for loading a 15.6 inch laptop.
    Safe design: flap over design with reinforced magnetic push button for your safety.
    Comfortable: padded and adjustable shoulder straps for added comfort and ventilation.
      """,
      rating: 29.99,
      isPopular: true,
    ),
    Product(
      id: 7,
      images: [
        "assets/images/backbag3.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "EverVanz Outdoor Canvas Backpack, Waterproof Travel Hiking Camping Backpack Bag, Large Casual Daypack, College School Backpack, Shoulder Bag for 15 Laptop Tablets ",
      price: 37.99,
      description: """
     HIGH QUALITY & WATERPROOF - Thick Canvas made of quality cotton and leather cassettes makes the backpack soft and durable. Extra tear-resistant nylon rain protection protects the backpack from scratches and dirt and keeps the backpack dry in snow and rain.
PRACTICAL - This backpack is perfect for everyday use such as school or work, travel, hiking mountaineering and camping. Ideal for men and women.
 LARGE CAPACITY - Large compartment for your daily essentials. Inner pockets including 2 open pockets, 1 padded compartment for tablet or laptop. 1 front pocket, 2 side pockets, and 1 back pocket with vertical zipper for small items, like your phone. Dimensions:18.5"H*11.8"L*6.3"W/ 47H*30L*16W cm. CAPACITY: 23L. Inner pocket for 15" tablet or laptop. 
      """,
      rating: 4,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 8,
      images: [
        "assets/images/backbag4.png",
        "assets/images/backbag4-1.png",
        "assets/images/backbag4-2.png",
        "assets/images/backbag4-3.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "SKYSPER Hiking Backpack for Men and Women, 30 Litres, Waterproof Travel Backpack, Multifunctional Camping Backpack, Foldable Light, Outdoor Daypack ",
      price: 36.99,
      description: """
    Lightweight and comfortable: the backpack has an ergonomically shaped, breathable mesh shoulder straps and a large amount of sponge padding to relieve shoulder pressure. The widened and thick adjustable shoulder straps and the highly elastic and breathable back support reduce the weight when walking and travelling.
Breathable and waterproof: the back uses a three-dimensional breathable mesh, which has good ventilation and sweat function and keeps the back dry, the use of high-quality tear-resistant waterproof 210D nylon material, durable metal zips and support points are reinforced to extend the service life.
【Large capacity】There is a 30 litre storage space, a computer compartment inside and elastic mesh pockets on the side for easy insertion and recovery. The storage compartment has a reasonable layout and is practical for sorting and storing items. Sufficient space can be used for 1-3 days for hiking rides. """,
      rating: 4.1,
      isFavourite: true,
    ),

    // gaming 9->10
    Product(
      id: 9,
      images: [
        "assets/images/console.png",
        "assets/images/console1.png",
        "assets/images/console2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "Nintendo Switch with Neon Blue and Neon Red Joy‑Con - HAC-001(-01) ",
      price: 324.00,
      description: """
     3 Play Styles: TV Mode, Tabletop Mode, Handheld Mode
6.2-inch, multi-touch capacitive touch screen
4.5-9+ Hours of Battery Life will vary depending on software usage conditions
Connects over Wi-Fi for multiplayer gaming; Up to 8 consoles can be connected for local wireless multiplayer
Model number: HAC-001(-01) """,
      rating: 5,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 10,
      images: [
        "assets/images/vr.png",
        "assets/images/vr1.png",
        "assets/images/vr2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Oculus Quest All-in-one VR Gaming Headset – 64GB ",
      price: 269.90,
      description: """
    
    All-in-one VR: Simply set up the device with your Oculus mobile app and Oculus Quest has everything you need to explore VR, right out of the box
    Insight tracking: Oculus Insight tracking system instantly reflects your movements in VR without the need for any external accessories
    Touch controllers: Oculus Touch controllers precisely recreate your hands, their gestures and interactions, so every game is real enough to reach out and touch
    Beyond room-scale: Oculus Quest works with your environment, so you can play standing or sitting, in spaces big or small
    Oculus Quest requires your Facebook account to log in, making it easy to meet up with friends in VR and discover communities around the world.

      """,
      rating: 4,
      isPopular: true,
    ),
    // purses 11 -> 14
    Product(
      id: 11,
      images: [
        "assets/images/purse1.jpg",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "Syrads Women PU Leather Wallet Large Capacity Purses for Women Multiple Card Slots Purse",
      price: 17.47,
      description: """
    Size: 11*8*2.5cm (L*W*H)
    Material:PU Leather
    Features: 1 large banknote holder (can increase banknotes), 5 card slots, 1 photo slot, 1 zipper pocket, complete functions, very practical
    Capacity: You can comfortably store your credit card/identity/driver's license/banknotes/coins
    Applicable occasions: shopping, travel, holiday, hiking, school, camping and party shopping; it is also a perfect gift for friends and family on birthdays, anniversaries, etc.
""",
      rating: 4,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 12,
      images: [
        "assets/images/purse2.jpg",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Eastpak Crew Single Wallet CREW SINGLE 100% polyamide 0.5liters",
      price: 16,
      description: """"
    Multi-compartment interior and space for cards and cash
    Height:9.5cm, Width:13.5cm
    Made from 100% nylon
    There's a zippered compartment on the back for small keys or essentials

      """,
      rating: 4.1,
      isPopular: true,
    ),
    Product(
      id: 13,
      images: [
        "assets/images/purse3.jpg",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wallet S kids 11,5 x 7,5 x 2 cm cats and dogs mint",
      price: 11.55,
      description: """
    Size (W x H x D): 11.5 x 7.5 x 2 cm
    Handy wallet for small organisation talents - and anyone who wants to become it
    Material: high-quality, tear-resistant polyester fabric, water-repellent
    Buttons or real money: thanks to Velcro closure and inner pocket with additional zip, nothing is lost
    Clear layout with 2 slip pockets and 1 viewing window

      """,
      rating: 4.7,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 14,
      images: [
        "assets/images/purse4.jpg",
        "assets/images/purse4-1.jpg",
        "assets/images/purse4-2.jpg",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title:
          "LEAS Mini Wallet RFID Protection in Genuine Leather, Black Mini Edition ",
      price: 20.20,
      description: """
    ✔ Handmade from high-quality cowhide leather - Credit card slots sewn individually for a longer service life
    ✔ Wallet super flat and perfect for the trouser pocket
    ✔ Space for cards, coins and notes
    ✔ Space for up to 3 cards thanks to innovative wrap shape
    ✔ An excellent gift for special occasions such as birthdays, Christmas, Easter, christening or as a travel wallet or travel wallet
      """,
      rating: 4.1,
      isFavourite: true,
    ),
  ];
  static String description =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
}
