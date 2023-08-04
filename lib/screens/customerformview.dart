import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewForm extends StatefulWidget {
  const ViewForm({super.key});

  @override
  State<ViewForm> createState() => _ViewFormState();
}

class _ViewFormState extends State<ViewForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details'),
      ),
      body: CustomerDetailsList(),);
  }
}
class CustomerDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('customers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching data'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final customers = snapshot.data?.docs ?? [];

        if (customers.isEmpty) {
          return Center(
            child: Text('No customer data found'),
          );
        }

        return ListView.builder(
          itemCount: customers.length,
          itemBuilder: (context, index) {
            final customer = customers[index].data();
            return ExpansionTile(
              title: Text('Name: ${customer['name']}'),
              children: [
                ListTile(
                  title: Text('Phone: ${customer['phone']}'),
                ),
                ListTile(
                  title: Text('Address: ${customer['address']}'),
                ),
                ListTile(
                  title: Text('Status: ${customer['status']}'),
                ),
                ListTile(
                  title: Text('Gender: ${customer['gender']}'),
                ),
                ListTile(
                  title: Text('Age: ${customer['age']}'),
                ),
                // Add more ListTile widgets for additional fields as needed
              ],
            );
          },
        );
      },
    );
  }
}
