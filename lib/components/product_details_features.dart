import '../utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsFeatures extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProductDetailsFeatures({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: kLightGrey,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: IconTheme(
              data: const IconThemeData(
                size: 24,
              ),
              child: Icon(icon),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            text,
            style: const TextStyle(
              color: kBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
