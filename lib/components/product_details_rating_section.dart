import '../utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsRatingSection extends StatelessWidget {
  const ProductDetailsRatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.star_border_purple500_rounded,
          color: kOrange,
          size: 22,
        ),
        Icon(
          Icons.star_border_purple500_rounded,
          color: kOrange,
          size: 22,
        ),
        Icon(
          Icons.star_border_purple500_rounded,
          color: kOrange,
          size: 22,
        ),
        Icon(
          Icons.star_border_purple500_rounded,
          color: kOrange,
          size: 22,
        ),
        Icon(
          Icons.star_border_purple500_rounded,
          color: kOrange,
          size: 22,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 4),
          child: Text(
            '5',
            style: TextStyle(
              color: kBlack,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 4),
          child: Text(
            '(28 Reviews)',
            style: TextStyle(
              color: kTextGrey,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
