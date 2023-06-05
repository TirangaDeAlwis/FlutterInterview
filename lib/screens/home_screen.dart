import '../utils/colors.dart';
import '../components/home_title.dart';
import 'package:flutter/material.dart';
import '../components/app_bar_icon.dart';
import '../components/home_main_card.dart';
import '../components/home_tab_button.dart';
import '../components/home_products_list.dart';
import '../components/bottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        title: const Text('Flutter Menu Demo'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: AppBarIcon(
            icon: Icons.menu_rounded,
            color: kBlack,
            size: 30,
          ),
        ),
        toolbarHeight: 60,
        actions: const [
          AppBarIcon(
            icon: Icons.search_rounded,
            color: kBlack,
            size: 26,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: AppBarIcon(
              icon: Icons.mail_lock_rounded,
              color: kBlack,
              size: 26,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: kWhite,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                HomeTitle(
                  title: 'Enjoy the world \ninto virtual reality',
                  textStyle: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                HomeMainCard(
                  title: 'Improved Controller \nDesign With \nVirtual Reality',
                  buttonTitle: 'Buy Now!',
                  image: 'assets/images/home_image.png',
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28),
                  child: SizedBox(
                    height: 40,
                    child: HomeTabButton(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28, bottom: 30),
                  child: SizedBox(
                    height: 290,
                    child: HomeProductsList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
