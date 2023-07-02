import 'package:Groceteria/screens/NotificationDemo.dart';
import 'package:Groceteria/screens/cart.dart';
import 'package:Groceteria/screens/vegetables.dart';
import 'package:Groceteria/services/NotificationService.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_catalog/screens/NotificationDemo.dart';
// import 'package:flutter_catalog/screens/cart.dart';
// import 'package:flutter_catalog/screens/vegetables.dart';
// import 'package:flutter_catalog/services/NotificationService.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/dashboard.dart';
import 'screens/registration.dart';
import 'screens/splash.dart';
import 'screens/vegetable_detail.dart';
import 'screens/welcome.dart';
import 'utils/routes.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initialize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grocery App",
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      initialRoute: "/DashboardScreen",
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.welcomeRoute: (context) => WelcomeScreen(),
        MyRoutes.registrationRoute: (context) => RegistrationScreen(),
        MyRoutes.dashboardRoute: (context) => DashboardScreen(),
        MyRoutes.vegetablesRoute: (context) => VegetablesScreen(),
        MyRoutes.vegetableDetailRoute: (context) => VegetableDetailScreen(),
        MyRoutes.cartRoute: (context) => CartScreen(),
        // MyRoutes.notificationDemoRoute: (context) => NotificationDemo(),
      },
    );
  }
}
