import 'package:flutter/material.dart';

void main() {
  runApp(CancelOrderApp());
}

class CancelOrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cancel Order App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CancelOrderScreen(),
    );
  }
}

class Order {
  final String id;
  final String productName;

  Order({required this.id, required this.productName});
}

class CancelOrderScreen extends StatefulWidget {
  @override
  _CancelOrderScreenState createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  List<Order> orders = [
    Order(id: '1', productName: 'Product A'),
    Order(id: '2', productName: 'Product B'),
    Order(id: '3', productName: 'Product C'),
  ];

  void cancelOrder(String orderId) {
    setState(() {
      orders.removeWhere((order) => order.id == orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancel Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          Order order = orders[index];
          return ListTile(
            title: Text(order.productName),
            subtitle: Text('Order ID: ${order.id}'),
            trailing: ElevatedButton(
              onPressed: () => cancelOrder(order.id),
              child: Text('Cancel'),
            ),
          );
        },
      ),
    );
  }
}
