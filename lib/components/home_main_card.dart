import '../utils/colors.dart';
import 'package:flutter/material.dart';

class HomeMainCard extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final String image;

  const HomeMainCard({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kDarkBlue,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: kWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: kWhite,
                    ),
                    child: Text(
                      buttonTitle,
                      style: const TextStyle(
                        color: kDarkBlue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -22,
          right: -20,
          child: Image.asset(
            image,
            height: 240,
            width: 240,
          ),
        ),
      ],
    );
  }
}
