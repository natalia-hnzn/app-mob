// ad_page.dart
import 'package:flutter/material.dart';

class AdPage extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;

  AdPage({required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ad Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context)
                .size
                .width, // Set the width to the screen width
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Name: $name',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Price: \$${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
