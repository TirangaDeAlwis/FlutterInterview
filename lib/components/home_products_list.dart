import 'dart:async';
import 'dart:convert';
import '../utils/colors.dart';
import '../screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/product_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeProductsList extends StatefulWidget {
  const HomeProductsList({Key? key}) : super(key: key);

  @override
  State<HomeProductsList> createState() => _HomeProductsListState();
}

class _HomeProductsListState extends State<HomeProductsList> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getProductsData();
  }

  Future<void> getProductsData() async {
    if (await NetworkChecker.checkNetwork()) {
      try {
        final response = await http.get(Uri.parse('https://api.npoint.io/a907f54f4d95e9e31711'));
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = json.decode(response.body);
          setState(() {
            products = jsonList;
            isLoading = false;
          });
        } else {
          showAlert(context, 'Something went wrong! - ${response.statusCode}');
        }
      } catch (exception) {
        showAlert(context, '$exception Something went wrong!');
      }
    } else {
      showAlert(context, 'No network connection available!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(color: kLightBlue),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.only(left: 25),
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.only(right: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)),
                    );
                  },
                  child: Container(
                    width: 145,
                    height: 290,
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: product['images'] ?? '',
                              placeholder: (context, url) => const Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) => const Icon(Icons.error, size: 24),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              product['title'],
                              style: const TextStyle(
                                color: kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                product['price'],
                                style: const TextStyle(
                                  color: kDarkGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                color: kBlack,
                              ),
                              child: const Icon(
                                Icons.add_rounded,
                                color: kWhite,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }

  // AlertDialog
  showAlert(BuildContext context, String msg) {
    AlertDialog alert = AlertDialog(
      backgroundColor: kWhite,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      title: const Center(
        child: Text(
          'Attention!',
          style: TextStyle(
            color: kBlack,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kBlack.withOpacity(0.8),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: Container(
                height: 53,
                width: 126,
                decoration: BoxDecoration(
                  color: kRed,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.25, color: kBlack),
                ),
                child: const Center(
                  child: Text(
                    'Retry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      actionsPadding: const EdgeInsets.only(top: 10, bottom: 20),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// InternetConnectionChecker
class NetworkChecker {
  static Future<bool> checkNetwork() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    return isConnected;
  }
}
