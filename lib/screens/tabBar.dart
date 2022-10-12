import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './products_sample_view.dart';
import './user_product_screen.dart';
import './favorited_Screen.dart';
import './seacrh_Screen.dart';

class TabBarScreen extends StatefulWidget {
  static final routeName = '/tabScreen';
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  static final List<Widget> screenList = [
    ProductsSampleScreen(),
    FavoritedScreen(),
    SearchScreen(),
    UserProductScreen(),
  ];
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.76),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 8,
              activeColor: Theme.of(context).primaryColor.withOpacity(0.75),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100],
              color: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
