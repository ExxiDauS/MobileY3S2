import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ShopScreen extends StatelessWidget {

final List<Product> products = [
    Product(name: 'MacBook Pro', price: 45000, icon: Icons.laptop),
    Product(name: 'iPhone 15', price: 32000, icon: Icons.phone_iphone),
    Product(name: 'Airpods 4', price: 7000, icon: Icons.headset),
    Product(name: 'Apple Watch', price: 12000, icon: Icons.watch)
  ];

final List<Product> bestSellers = [
    Product(name: 'iPad Pro', price: 25000, icon: Icons.tablet),
    Product(name: 'Magic Mouse', price: 4000, icon: Icons.mouse),
    Product(name: 'USB-C Hub', price: 2500, icon: Icons.usb),
  ];

ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Shop')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // --- ส่วนที่ 1: Header (Banner) ---
          _buildHeader(),
          SizedBox(height: 20),

          // --- ส่วนที่ 2: Section Title ---
          Text(
            'New Arrivals',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // --- ส่วนที่ 3: Product Items (Card) ---
          for (var product in products) ProductCard(product: product),
          SizedBox(height: 20),

          Text('Best Sellers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          for (var product in bestSellers)
            ProductCard(product: product),
          ],
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(
        'Welcome to IT Shop',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
