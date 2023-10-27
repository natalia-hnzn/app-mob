import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Category 1'),
    Tab(text: 'Category 2'),
    Tab(text: 'Category 3'),
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store Catalog'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add search functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Add shopping cart functionality here
              },
            ),
          ],
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [
            _buildCategoryPage('Category 1'),
            _buildCategoryPage('Category 2'),
            _buildCategoryPage('Category 3'),
            // Add more category pages as needed
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryPage(String category) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category: $category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Product List
          // Replace the following list with your product list
          // You can use ListView.builder for a dynamic list of products
          ListView(
            shrinkWrap: true,
            children: [
              ProductCard(title: 'Product 1', price: 19.99),
              ProductCard(title: 'Product 2', price: 24.99),
              // Add more products as needed
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final double price;

  ProductCard({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('assets/noimage.png'),
            height: 200, // Adjust the height as needed
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Price: \$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add 'details' button functionality here
                  },
                  child: Text('Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Catalog(),
  ));
}
