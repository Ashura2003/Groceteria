
import 'package:Groceteria/screens/adminDashboard.dart';
import 'package:Groceteria/screens/cart.dart';
import 'package:Groceteria/screens/form.dart';
import 'package:Groceteria/screens/splash.dart';
import 'package:Groceteria/screens/vegetables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/dashboard.dart';
import 'screens/registration.dart';
import 'screens/vegetable_detail.dart';
import 'screens/welcome.dart';
import 'utils/routes.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // NotificationService.initialize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grocery App",
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      // initialRoute: MyRoutes.welcomeRoute,
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.welcomeRoute: (context) => WelcomeScreen(),
        MyRoutes.registrationRoute: (context) => RegistrationScreen(),
        MyRoutes.dashboardRoute: (context) => DashboardScreen(),
        MyRoutes.vegetablesRoute: (context) => VegetablesScreen(),
        MyRoutes.vegetableDetailRoute: (context) => VegetableDetailScreen(),
        MyRoutes.cartRoute: (context) => CartScreen(),
        MyRoutes.adminDashboard: (context) =>AdminDashboard(),
        MyRoutes.formRoute: (context) => CustomerForm(),
      },
    );
  }
}
