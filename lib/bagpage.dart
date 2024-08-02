import 'package:ecommerce/fashionsale.dart';
import 'package:ecommerce/favpage.dart';
import 'package:ecommerce/profilepage.dart';
import 'package:ecommerce/shoppage.dart';
import 'package:flutter/material.dart';

class BagPage extends StatefulWidget {
  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  int _selectedIndex = 2;

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
        title: const Text('My Bag'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBagItem(
              'Pullover',
              'Color: Black',
              'Size: L',
              'assets/images/product1.png',
              '51\$',
            ),
            _buildBagItem(
              'T-Shirt',
              'Color: Gray',
              'Size: L',
              'assets/images/product2.png',
              '30\$',
            ),
            _buildBagItem(
              'Sport Dress',
              'Color: Black',
              'Size: M',
              'assets/images/product1.png',
              '43\$',
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your promo code',
                  suffixIcon: Icon(Icons.arrow_forward),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '124\$',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(screenWidth, 50),
                ),
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
                        builder: (BuildContext context) => ProfilePage()));
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

  Widget _buildBagItem(
    String title,
    String subtitle1,
    String subtitle2,
    String imagePath,
    String price,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle1,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle2,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(price),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  const Text('1'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
