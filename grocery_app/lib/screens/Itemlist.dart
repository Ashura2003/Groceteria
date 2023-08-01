import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';


class GroceryItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  GroceryItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Itemlist extends StatelessWidget {
  final List<GroceryItem> groceryItems = [
    GroceryItem(
      name: 'Apples',
      description: 'Fresh and delicious apples',
      price: 2.99,
      imageUrl: 'assets/images/apple.png',
    ),
    GroceryItem(
      name: 'Bananas',
      description: 'Ripe and healthy bananas',
      price: 1.49,
      imageUrl: 'assets/images/banana.png',
    ),
    GroceryItem(
      name: 'Oranges',
      description: 'Juicy and vitamin-rich oranges',
      price: 3.99,
      imageUrl: 'assets/images/orange.png',
    ),
    GroceryItem(
      name: 'Strawberries',
      description: 'Sweet and succulent strawberries',
      price: 4.99,
      imageUrl: 'assets/images/strawberry.png',
    ),
    GroceryItem(
      name: 'Grapes',
      description: 'Plump and refreshing grapes',
      price: 3.49,
      imageUrl: 'assets/images/grape.png',
    ),
    GroceryItem(
      name: 'Bread',
      description: 'Fresh bread',
      price: 1.49,
      imageUrl: 'assets/images/bread.png',
    ),
    // Add more grocery items here
  ];

  List<GroceryItem> getRandomItems(int count) {
    List<GroceryItem> randomItems = [];
    Random random = Random();

    while (randomItems.length < count && randomItems.length < groceryItems.length) {
      int index = random.nextInt(groceryItems.length);
      if (!randomItems.contains(groceryItems[index])) {
        randomItems.add(groceryItems[index]);
      }
    }

    return randomItems;
  }

  @override
  Widget build(BuildContext context) {
    List<GroceryItem> randomItems = getRandomItems(groceryItems.length);

    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Container(
            // height: 230,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(50),
            //   ),
            //   color: Color(0xFF363f93),
            // ),
            // child: Stack(
            //   children: [
            //     Positioned(
            //       top: 80,
            //       left: 0,
            //       child: Container(
            //         height: 100,
            //         width: 300,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(50),
            //             bottomRight: Radius.circular(50),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Item List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: randomItems.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          randomItems[index].imageUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 8),
                        Text(
                          randomItems[index].name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          randomItems[index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '\$${randomItems[index].price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
