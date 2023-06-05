import '../utils/colors.dart';
import 'package:flutter/material.dart';

class HomeTabButton extends StatefulWidget {
  const HomeTabButton({Key? key}) : super(key: key);

  @override
  State<HomeTabButton> createState() => _HomeTabButtonState();
}

class _HomeTabButtonState extends State<HomeTabButton> {
  final List<String> tabsList = [
    'All Products',
    'Popular',
    'Recent',
    'Early',
  ];

  int selectedTabViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tabsList.length,
      padding: const EdgeInsets.only(left: 25),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 25),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTabViewIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                color: selectedTabViewIndex == index ? kDarkBlue : kLightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  tabsList[index],
                  style: TextStyle(
                    color: selectedTabViewIndex == index ? kWhite : kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
