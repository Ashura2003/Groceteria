import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Item {
  String name;
  double price;

  Item({required this.name, required this.price});
}

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<Item> itemList = [
    Item(name: 'Item 1', price: 10.0),
    Item(name: 'Item 2', price: 20.0),
  ];

  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late Item _selectedItem;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _editItem(Item item) {
    setState(() {
      _selectedItem = item;
      _nameController.text = item.name;
      _priceController.text = item.price.toString();
    });
  }

  void _updateItemDetails() {
    String newName = _nameController.text;
    double newPrice = double.parse(_priceController.text);

    // Perform the update operation here
    // For simplicity, we'll just print the updated values
    if (kDebugMode) {
      print('Updated Item Name: $newName');
    }
    print('Updated Item Price: $newPrice');

    _selectedItem.name = newName;
    _selectedItem.price = newPrice;

    _clearSelection();
  }

  void _clearSelection() {
    setState(() {
      _selectedItem = Item(name: '', price: 0.0);
      _nameController.text = '';
      _priceController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList[index].name),
                  subtitle: Text(
                      'Price: \$${itemList[index].price.toStringAsFixed(2)}'),
                  onTap: () => _editItem(itemList[index]),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: _updateItemDetails,
                        child: Text('Save Changes'),
                      ),
                      ElevatedButton(
                        onPressed: _clearSelection,
                        child: Text('Clear Selection'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListPage(),
    );
  }
}


