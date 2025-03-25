import 'package:donut_app_8sc/pages/home_page.dart';
import 'package:donut_app_8sc/tabs/donut_tab.dart'; // Import the DonutTab
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package

void main() {
  runApp(
    // Wrap the app with ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => DonutTab(), // Create an instance of DonutTab
      child: const MyApp(), // Your existing MyApp
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donut Shop',
      theme: ThemeData(
        useMaterial3: true,
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.pink,
        ),
      ),
      home: const HomePage(),
    );
  }
}