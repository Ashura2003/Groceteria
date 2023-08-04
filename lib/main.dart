//
// import 'package:Groceteria/screens/adminDashboard.dart';
// import 'package:Groceteria/screens/cart.dart';
// import 'package:Groceteria/screens/form.dart';
// import 'package:Groceteria/screens/splash.dart';
// import 'package:Groceteria/screens/vegetables.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'screens/dashboard.dart';
// import 'screens/registration.dart';
// import 'screens/vegetable_detail.dart';
// import 'screens/welcome.dart';
// import 'utils/routes.dart';
//
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   // NotificationService.initialize();
//   runApp(const MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Grocery App",
//       theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
//       // initialRoute: MyRoutes.welcomeRoute,
//       routes: {
//         "/": (context) => SplashScreen(),
//         MyRoutes.welcomeRoute: (context) => WelcomeScreen(),
//         MyRoutes.registrationRoute: (context) => RegistrationScreen(),
//         MyRoutes.dashboardRoute: (context) => DashboardScreen(),
//         MyRoutes.vegetablesRoute: (context) => VegetablesScreen(),
//         MyRoutes.vegetableDetailRoute: (context) => VegetableDetailScreen(),
//         MyRoutes.cartRoute: (context) => CartScreen(),
//         MyRoutes.adminDashboard: (context) =>AdminDashboard(),
//         MyRoutes.formRoute: (context) => CustomerForm(),
//       },
//     );
//   }
// }



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:groceteria/screens/adminDashboard.dart';
import 'package:groceteria/screens/cart.dart';
import 'package:groceteria/screens/customerformview.dart';
import 'package:groceteria/screens/dashboard.dart';
import 'package:groceteria/screens/form.dart';
import 'package:groceteria/screens/login.dart';
import 'package:groceteria/screens/registration.dart';
import 'package:groceteria/screens/signup.dart';
import 'package:groceteria/screens/vegetable_detail.dart';
import 'package:groceteria/screens/vegetables.dart';
import 'package:groceteria/screens/welcome.dart';
import 'package:groceteria/viewmodel/additemviewmodel.dart';
import 'package:provider/provider.dart';

import 'additem.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<ItemViewModel>(create: (_) => ItemViewModel()),


      ],

      child:
      GetMaterialApp(

          debugShowCheckedModeBanner: false,
          initialRoute: "login",
          routes: {
            "AdminAddItems": (context) => const AdminAddItems(),

            "welcome": (context) => const WelcomeScreen(),
            "registration": (context) => const RegistrationScreen(),
            "dashboard": (context) => const DashboardScreen(),
            "vegetables": (context) => const VegetablesScreen(),
            "vegetable_detail": (context) => const VegetableDetailScreen(),
            "cart": (context) => const CartScreen(),
            "adminDashboard": (context) => const AdminDashboard(),
            "form": (context) =>  CustomerForm(),
            "customerForm": (context) =>  const ViewForm(),
            "signup": (context) =>   SignupPage(),
            "login": (context) =>   LoginPage(),

          }
      ),
    );


  }
}
