import 'package:ecommerce/bagpage.dart';
import 'package:ecommerce/fashionsale.dart';
import 'package:ecommerce/profilepage.dart';
import 'package:ecommerce/shoppage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoritesPage(),
    );
  }
}

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _selectedIndex = 3;

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
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterChip(
                    label: Text('Summer'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 8),
                  FilterChip(
                    label: Text('Summer'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 8),
                  FilterChip(
                    label: Text('Summer'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 8),
                  FilterChip(
                    label: Text('T-Shirts'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 8),
                  FilterChip(
                    label: Text('Shirts'),
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.view_list),
                  onPressed: () {},
                ),
              ],
            ),
          ])),
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

  Widget _buildFavoriteItem(
    BuildContext context,
    String imagePath,
    String brand,
    String title,
    String color,
    String size,
    double price,
    double rating,
    int reviewCount,
    bool isNew,
  ) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading:
            Image.asset(imagePath, fit: BoxFit.cover, width: 60, height: 60),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(brand),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text('Color: $color  Size: $size'),
                    Spacer(),
                    Text('\$$price'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    // Handle remove from favorites
                  },
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('$rating ($reviewCount)'),
                  ],
                ),
                if (isNew)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('NEW', style: TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
