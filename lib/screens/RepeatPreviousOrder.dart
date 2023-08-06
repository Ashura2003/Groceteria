import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class PurchaseHistory extends StatelessWidget {
  final List<PurchaseHistoryItem> purchaseHistoryItems;

  const PurchaseHistory({Key? key, required this.purchaseHistoryItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(purchaseHistoryItems);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase History"),
      ),
      body: ListView.builder(
        itemCount: purchaseHistoryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(purchaseHistoryItems[index].productName),
            subtitle: Text(
                "\$${purchaseHistoryItems[index].price}"),
            leading: Icon(Icons.shopping_cart),
            trailing: Text(purchaseHistoryItems[index].date),
          );
        },
      ),
    );
  }
}

class PurchaseHistoryItem {
  String productName;
  int price;
  String date;

  PurchaseHistoryItem({required this.productName, required this.price, required this.date});

  factory PurchaseHistoryItem.fromJson(Map<String, dynamic> json) {
    return PurchaseHistoryItem(
      productName: json['productName'],
      price: json['price'],
      date: json['date'],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PurchaseHistory(
      purchaseHistoryItems: [
        PurchaseHistoryItem.fromJson({
          'productName': 'Product 1',
          'price': 100,
          'date': '2023-07-01',
        }),
        PurchaseHistoryItem.fromJson({
          'productName': 'Product 2',
          'price': 50,
          'date': '2023-06-30',
        }),
        PurchaseHistoryItem.fromJson({
          'productName': 'Product 3',
          'price': 20,
          'date': '2023-06-29',
        }),
      ],
    ),
  ));
}
