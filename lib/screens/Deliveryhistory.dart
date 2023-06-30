import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeliveryHistoryScreen extends StatefulWidget {
  @override
  _DeliveryHistoryScreenState createState() => _DeliveryHistoryScreenState();
}

class _DeliveryHistoryScreenState extends State<DeliveryHistoryScreen> {
  final _firestore = FirebaseFirestore.instance;

  List<DeliveryItem> deliveryItems = [];

  @override
  void initState() {
    super.initState();
    _loadDeliveryItems();
  }

  void _loadDeliveryItems() async {
   final deliveryItemsRef = _firestore.collection('delivery_items');
    final deliveryItemsSnapshot = await deliveryItemsRef.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery History"),
      ),
      body: ListView.builder(
        itemCount: deliveryItems.length,
        itemBuilder: (context, index) {
          DeliveryItem deliveryItem = deliveryItems[index];
          return ListTile(
            title: Text(deliveryItem.orderId.toString()),
            subtitle: Text(deliveryItem.status),
            onTap: () {
// Show more details about the delivery item.
            },
            trailing: Column(
              children: [
                Text(deliveryItem.itemName),
                Text(deliveryItem.personName),
                Text(deliveryItem.location)
              ],
            ),
          );
        },
      ),
    );
  }
}
class DeliveryItem {
  int orderId;
  String status;
  String date;
  String itemName;
  String personName;
  String location;

  DeliveryItem({required this.orderId, required this.status, required this.date, required this.itemName, required this.personName, required this.location});

  factory DeliveryItem.fromJson(Map<String, dynamic> json) {
    return DeliveryItem(
      orderId: json['orderId'],
      status: json['status'],
      date: json['date'],
      itemName: json['itemName'],
      personName: json['personName'],
      location: json['location'],
    );
  }

  Future<Widget> getSecondary() async {
  return Text(location);
  }
}