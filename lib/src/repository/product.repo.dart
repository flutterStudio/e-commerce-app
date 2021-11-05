import 'package:e_commerce/src/model/product.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductRepo {
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
  ];

  List<Product> purses = [
    Product(
      id: 1,
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
      id: 2,
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
      id: 3,
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
      id: 4,
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
