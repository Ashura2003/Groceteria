import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String phone = '';
  String address = '';
  String status = '';
  String gender = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      fullName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Status'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your status';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Gender'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      age = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final database = FirebaseFirestore.instance.collection('customers');
    database.add({
      'name': fullName,
      'phone': phone,
      'address': address,
      'status': status,
      'gender': gender,
      'age': age,
    }).then((_) {
      // Data submitted successfully
      print('Form Submitted to Firebase');
      _resetForm();
    }).catchError((error) {
      // Handle any errors that occurred during data submission
      print('Error submitting form data: $error');
    });
  }


  void _resetForm() {
    // Reset the form fields after submission
    setState(() {
      _formKey.currentState!.reset();
      fullName = '';
      phone = '';
      address = '';
      status = '';
      gender = '';
      age = 0;
    });
  }
}

