import '../utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsSwipeIndicators extends StatelessWidget {
  const ProductDetailsSwipeIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              color: kWhite,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: kWhite.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: kWhite.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
