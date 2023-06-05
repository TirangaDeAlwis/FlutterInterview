import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final TextStyle textStyle;

  const HomeTitle({
    Key? key,
    required this.title,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 25, bottom: 25),
      child: Text(
        title,
        style: textStyle,
        textAlign: TextAlign.left,
      ),
    );
  }
}
