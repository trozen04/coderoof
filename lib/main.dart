import 'package:flutter/material.dart';
import 'utils/app_routes.dart';
import 'Screens/subscription_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mixer',
      theme: ThemeData(
        fontFamily: 'Manrope',
      ),
      initialRoute: AppRoutes.subscription,
      routes: {
       // AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.subscription: (context) => const SubscriptionScreen(),
      },
    );
  }
}
