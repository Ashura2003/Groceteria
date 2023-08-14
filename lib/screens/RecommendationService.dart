import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recommendations = [
    {
      'name': 'Product 1',
      'image': 'assets/images/apple.png',
    },
    {
      'name': 'Product 2',
      'image': 'assets/images/banana.png',
    },
    {
      'name': 'Product 3',
      'image': 'assets/images/grape.png',
    },
    // Add more products with their respective images
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: recommendations.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image.asset(
                  recommendations[index]['image'],
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.0),
                Text(
                  recommendations[index]['name'],
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

