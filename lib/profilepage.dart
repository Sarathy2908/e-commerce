import 'package:ecommerce/bagpage.dart';
import 'package:ecommerce/fashionsale.dart';
import 'package:ecommerce/favpage.dart';
import 'package:ecommerce/shoppage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;

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
        title: const Text('My profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/product1.png'), // Replace with your profile image path
              ),
              title: Text('Matilda Brown'),
              subtitle: Text('matildabrown@mail.com'),
            ),
            _buildProfileOption('My orders', 'Already have 12 orders'),
            _buildProfileOption('Shipping addresses', '3 addresses'),
            _buildProfileOption('Payment methods', 'Visa **34'),
            _buildProfileOption('Promocodes', 'You have special promocodes'),
            _buildProfileOption('My reviews', 'Reviews for 4 items'),
            _buildProfileOption('Settings', 'Notifications, password'),
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
              child: const Icon(Icons.home),
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
              child: const Icon(Icons.shop),
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
              child: const Icon(Icons.shopping_bag),
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
              child: const Icon(Icons.favorite),
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
              child: const Icon(Icons.person),
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

  Widget _buildProfileOption(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
     
      },
    );
  }
}
