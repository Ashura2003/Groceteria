import 'package:flutter/material.dart';



class GroceryStore extends StatefulWidget {
  const GroceryStore({super.key});

  @override
  State<GroceryStore> createState() => _GroceryStoreState();
}

class _GroceryStoreState extends State<GroceryStore> {
  List<String> items = [];
  List<double> prices = [];

  double calculateTotal() {
    double total = 0.0;
    for (double price in prices) {
      total += price;
    }
    return total;
  }

  void addItem(String item, double price) {
    setState(() {
      items.add(item);
      prices.add(price);
    });
  }

  void generateBill() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bill'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Items:'),
              for (int i = 0; i < items.length; i++)
                Text('${items[i]} - \$${prices[i].toStringAsFixed(2)}'),
              const SizedBox(height: 16.0),
              Text('Total: \$${calculateTotal().toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String itemName = ''; // Initialize with an empty string
    double itemPrice = 0.0; // Initialize with 0.0

    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Store'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                  subtitle: Text('\$${prices[index].toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${calculateTotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add Item'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Item Name'),
                          onChanged: (value) {
                            itemName = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Item Price'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            itemPrice = double.tryParse(value) ?? 0.0;
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Add'),
                        onPressed: () {
                          if (itemName.isNotEmpty && itemPrice != 0.0) {
                            addItem(itemName, itemPrice);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: generateBill,
            child: Icon(Icons.receipt),
          ),
        ],
      ),
    );
  }
}
