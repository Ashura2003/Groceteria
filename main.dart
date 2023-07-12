import 'package:Groceteria/screens/cart.dart';
import 'package:Groceteria/screens/dashboard.dart';
import 'package:Groceteria/screens/edit_profile.dart';
import 'package:Groceteria/screens/payment.dart';
import 'package:Groceteria/screens/profile_screen.dart';
import 'package:Groceteria/screens/registration.dart';
import 'package:Groceteria/screens/vegetable_detail.dart';
import 'package:Groceteria/screens/vegetables.dart';
import 'package:Groceteria/screens/welcome.dart';
import 'package:Groceteria/services/NotificationService.dart';
import 'package:Groceteria/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khalti_flutter/khalti_flutter.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initialize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_efebe934195b44388c84c599d2b2b4eb', // Replace with your Khalti public key
      enabledDebugging: true, // Set to false to disable network logs
      builder: (context, navKey) {
        return MaterialApp(
          title: "Grocery App",
          theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
          navigatorKey: navKey,
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ], // Provide the navigatorKey from KhaltiScope
          // initialRoute: MyRoutes.paymentRoute,
          initialRoute: MyRoutes.profilescreenRoute,
          routes: {
            // Define your routes here
            MyRoutes.profilescreenRoute: ((context) => ProfileScreen()),

            MyRoutes.editprofileRoute: ((context) => EditProfilePage()),
            MyRoutes.paymentRoute: ((context) => Payment()),
            MyRoutes.welcomeRoute: (context) => WelcomeScreen(),
            MyRoutes.registrationRoute: (context) => RegistrationScreen(),
            MyRoutes.dashboardRoute: (context) => DashboardScreen(),
            MyRoutes.vegetablesRoute: (context) => VegetablesScreen(),
            MyRoutes.vegetableDetailRoute: (context) => VegetableDetailScreen(),
            MyRoutes.cartRoute: (context) => CartScreen(),
            // MyRoutes.notificationDemoRoute: (context) => NotificationDemo(),
          },
        );
      },
    );
  }
}