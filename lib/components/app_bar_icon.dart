import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function()? function;

  const AppBarIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: function ?? (){},
    );
  }
}
