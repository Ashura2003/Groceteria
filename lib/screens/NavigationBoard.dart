import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceteria_app/screens/DashBoard.dart';
import 'package:groceteria_app/screens/SearchPage.dart';
import 'package:groceteria_app/screens/CartScreen.dart';
import 'package:groceteria_app/screens/UserPage.dart';





class NavigationBoard extends StatefulWidget {
  const NavigationBoard({super.key});

  @override
  State<NavigationBoard> createState() => _NavigationBoardState();
}

class _NavigationBoardState extends State<NavigationBoard> {
  List pages = [
    Dashboard(),
    SearchPage(),
    CartScreen(),
    SearchPage()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem( label:"Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(label: "My", icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
