import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/screens/home/cart_page.dart';
import 'package:health_link/screens/home/home_page.dart';
import 'package:health_link/screens/home/products_page.dart';
import 'package:health_link/screens/home/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pages = [
    const HomePage(),
    const ProductsPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          selectedItemColor: BlueGrotto,
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Boxicons.bxs_home, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.local_pharmacy, 1),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.shopping_cart, 2),
              label: 'My Cart',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person, 3),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedTab == index ? BlueGrotto : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        iconData,
        color: _selectedTab == index
            ? Colors.white
            : const Color.fromARGB(255, 118, 118, 118),
      ),
    );
  }
}
