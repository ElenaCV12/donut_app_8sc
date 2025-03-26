import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app_8sc/tabs/donut_tab.dart';
import 'package:donut_app_8sc/tabs/burger_tab.dart';
import 'package:donut_app_8sc/tabs/smoothie_tab.dart';
import 'package:donut_app_8sc/tabs/pancakes_tab.dart';
import 'package:donut_app_8sc/tabs/pizza_tab.dart';
import 'package:donut_app_8sc/pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DonutTab()),
        ChangeNotifierProvider(create: (context) => BurgerTab()),
        ChangeNotifierProvider(create: (context) => SmoothieTab()),
        ChangeNotifierProvider(create: (context) => PancakesTab()),
        ChangeNotifierProvider(create: (context) => PizzaTab()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}