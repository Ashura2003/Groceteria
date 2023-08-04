import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum UserRole { customer, admin }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  UserRole _selectedUserRole = UserRole.customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<UserRole>(
                value: _selectedUserRole,
                onChanged: (UserRole? newValue) {
                  setState(() {
                    _selectedUserRole = newValue!;
                  });
                },
                items: UserRole.values.map((UserRole role) {
                  return DropdownMenuItem<UserRole>(
                    value: role,
                    child: Text(role == UserRole.customer ? 'Customer' : 'Admin'),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'User Role',
                ),
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleLogin();
                },
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Determine the user role based on the selectedUserRole variable
        String role = _selectedUserRole == UserRole.customer ? 'Customer' : 'Admin';
        print('User logged in as $role: ${userCredential.user!.email}');
        if (role == 'Admin') {
          Navigator.pushReplacementNamed(context, 'adminDashboard');
        } else {
          Navigator.pushReplacementNamed(context, 'dashboard');
        }
        setState(() {
          _errorMessage = '';
        });
      } catch (e) {
        // Handle login errors (e.g., wrong email/password, user not found, etc.).
        setState(() {
          _errorMessage = 'Login failed. $e';
        });
      }
    }
  }
}
