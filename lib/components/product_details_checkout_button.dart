import '../utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsCheckoutButton extends StatelessWidget {
  final String title;

  const ProductDetailsCheckoutButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.maxFinite,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kBlack.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: kWhite,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
