// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class GroceryItem {
//   final String name;
//   final double price;
//   final String image;
//
//   GroceryItem({required this.name, required this.price, required this.image});
// }
//
// class GroceryApp extends StatefulWidget {
//   @override
//   _GroceryAppState createState() => _GroceryAppState();
// }
//
// class _GroceryAppState extends State<GroceryApp> {
//   List<GroceryItem> groceryItems = [];
//
//   void fetchItems() {
//     FirebaseFirestore.instance
//         .collection('groceryItems')
//         .get()
//         .then((QuerySnapshot snapshot) {
//       setState(() {
//         groceryItems = snapshot.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//           return GroceryItem(
//             name: data['name'],
//             price: data['price'].toDouble(),
//             image: data['image'],
//           );
//         }).toList();
//       });
//     }).catchError((error) {
//       print('Error fetching items: $error');
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchItems();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grocery App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Grocery App'),
//         ),
//         body: ListView.builder(
//           itemCount: groceryItems.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               leading: Image.network(groceryItems[index].image),
//               title: Text(groceryItems[index].name),
//               subtitle: Text('Price: \$${groceryItems[index].price.toStringAsFixed(2)}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(GroceryApp());
// }
