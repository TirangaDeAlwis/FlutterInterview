import '../components/product_details_checkout_button.dart';
import '../components/product_details_rating_section.dart';
import '../components/product_details_swipe_indicators.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import '../components/app_bar_icon.dart';
import '../components/product_details_features.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: AppBarIcon(
            function: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_rounded,
            color: kWhite,
            size: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: AppBarIcon(
              function: () {},
              icon: Icons.mail_lock_rounded,
              color: kWhite,
              size: 25,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 250,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: 0.3,
                      // Set the desired opacity value between 0.0 and 1.0
                      child: SizedBox(
                        height: 240,
                        width: 240,
                        child: Image.asset("assets/images/product_details.png"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: product['images'] ?? '',
                        placeholder: (context, url) => const Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => const Icon(Icons.error, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ProductDetailsSwipeIndicators(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 25, left: 25),
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 15),
                        width: 80,
                        height: 4,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['title'],
                                          style: const TextStyle(
                                            color: kBlack,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            product['price'],
                                            style: const TextStyle(
                                              color: kBlack,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                        const ProductDetailsRatingSection(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Text(
                                  product['description'],
                                  style: const TextStyle(
                                    color: kTextGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15, bottom: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    ProductDetailsFeatures(
                                      icon: Icons.remove_red_eye_outlined,
                                      text: "Improved Optics",
                                    ),
                                    ProductDetailsFeatures(
                                      icon: Icons.wb_sunny_outlined,
                                      text: "Clear Brightness",
                                    ),
                                    ProductDetailsFeatures(
                                      icon: Icons.wifi_outlined,
                                      text: "Wifi Controllers",
                                    )
                                  ],
                                ),
                              ),
                              const ProductDetailsCheckoutButton(title: 'Checkout'),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
