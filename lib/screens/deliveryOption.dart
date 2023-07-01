import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryOption {
  final String title;
  final String description;

  DeliveryOption(this.title, this.description);
}

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  int selectedOptionIndex = -1;
  TextEditingController preferredAddressController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<DeliveryOption> deliveryOptions = [
    DeliveryOption('Home Delivery', 'Estimated delivery in 3-5 days'),
    DeliveryOption('Preferred', 'Specify preferred delivery address'),
  ];

  void selectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
      if (selectedOptionIndex == 0) {
        preferredAddressController.text = 'Mid baneshwor, Kathmandu'; // Set the previous default text for 'Home Delivery'
      } else {
        preferredAddressController.text = ''; // Keep the text field empty for 'Preferred'
      }
    });
  }

  void saveAddress() async {
    String preferredAddress = preferredAddressController.text;
    // Update the preferred address in Firestore
    DocumentReference deliveryRef = firestore.collection('delivery').doc('preferences');
    await deliveryRef.set({'Preferred Address': preferredAddress}, SetOptions(merge: true));
    print('Preferred address saved: $preferredAddress');
  }

  void saveHomeDeliveryAddress() async {
    String homeDeliveryAddress = preferredAddressController.text;
    // Update the home delivery address in Firestore
    DocumentReference deliveryRef = firestore.collection('delivery').doc('preferences');
    await deliveryRef.set({'Home Delivery': homeDeliveryAddress}, SetOptions(merge: true));
    print('Home delivery address saved: $homeDeliveryAddress');
  }

  @override
  void dispose() {
    preferredAddressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectOption(0); // Set the initial selection to 'Home Delivery'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Options'),
      ),
      body: ListView.builder(
        itemCount: deliveryOptions.length,
        itemBuilder: (context, index) {
          if (index == selectedOptionIndex && index != 0) {
            return ListTile(
              title: TextFormField(
                controller: preferredAddressController,
                decoration: InputDecoration(
                  labelText: deliveryOptions[index].description,
                ),
              ),
              leading: Radio<int>(
                value: index,
                groupValue: selectedOptionIndex,
                onChanged: (value) {
                  selectOption(value!);
                },
              ),
            );
          } else if (index == 0) {
            return ListTile(
              title: Text(deliveryOptions[index].title),
              subtitle: TextFormField(
                controller: preferredAddressController,
                decoration: InputDecoration(
                  labelText: 'Enter delivery address',
                ),
              ),
              leading: Radio<int>(
                value: index,
                groupValue: selectedOptionIndex,
                onChanged: (value) {
                  selectOption(value!);
                },
              ),
              onTap: () {
                selectOption(index);
              },
            );
          } else {
            return ListTile(
              title: Text(deliveryOptions[index].title),
              subtitle: Text(deliveryOptions[index].description),
              leading: Radio<int>(
                value: index,
                groupValue: selectedOptionIndex,
                onChanged: (value) {
                  selectOption(value!);
                },
              ),
              onTap: () {
                selectOption(index);
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (selectedOptionIndex == 0) {
              saveHomeDeliveryAddress();
            } else {
              saveAddress();
            }
          },
          child: Text('OK'),
        ),
      ),
    );
  }
}

