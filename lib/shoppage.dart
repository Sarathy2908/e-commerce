// ignore_for_file: unused_local_variable

import 'package:ecommerce/bagpage.dart';
import 'package:ecommerce/fashionsale.dart';
import 'package:ecommerce/favpage.dart';
import 'package:ecommerce/profilepage.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tabs for Women, Men, Kids
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(label: 'Women', isSelected: true),
                TabButton(label: 'Men', isSelected: false),
                TabButton(label: 'Kids', isSelected: false),
              ],
            ),
            // Summer Sales Banner
            Container(
              width: screenWidth,
              color: Colors.red,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            // Categories List
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildCategoryCard('New', 'assets/images/product1.png'),
                _buildCategoryCard('Clothes', 'assets/images/product1.png'),
                _buildCategoryCard('Shoes', 'assets/images/product1.png'),
                _buildCategoryCard('Accessories', 'assets/images/product1.png'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FashionSalePage()));
              },
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ShopPage()));
              },
              child: Icon(Icons.shop),
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BagPage()));
              },
              child: Icon(Icons.shopping_bag),
            ),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FavoritesPage()));
              },
              child: Icon(Icons.favorite),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage()));
              },
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  TabButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
