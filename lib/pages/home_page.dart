import 'package:donut_app_8sc/pages/cart_page.dart';
import 'package:donut_app_8sc/tabs/burger_tab.dart';
import 'package:donut_app_8sc/tabs/pancakes_tab.dart';
import 'package:donut_app_8sc/tabs/donut_tab.dart';
import 'package:donut_app_8sc/tabs/pizza_tab.dart';
import 'package:donut_app_8sc/tabs/smoothie_tab.dart';
import 'package:donut_app_8sc/utils/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png', tabName: 'Donuts'),
    const MyTab(iconPath: 'lib/icons/burger.png', tabName: 'Burger'),
    const MyTab(iconPath: 'lib/icons/smoothie.png', tabName: 'Smoothie'),
    const MyTab(iconPath: 'lib/icons/pancakes.png', tabName: 'Pancakes'),
    const MyTab(iconPath: 'lib/icons/pizza.png', tabName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, 
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.person)
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I Want to ', style: TextStyle(fontSize: 32)),
                  Text('Eat', 
                    style: TextStyle(
                      fontSize: 32, 
                      fontWeight: FontWeight.bold, 
                      decoration: TextDecoration.underline,
                    )
                  )
                ],
              ),
            ),
            TabBar(
              tabs: myTabs,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Consumer<DonutTab>(
                    builder: (context, donutTab, child) => donutTab.buildDonutGrid(),
                  ),
                  Consumer<BurgerTab>(
                    builder: (context, burgerTab, child) => burgerTab.buildBurgerGrid(),
                  ),
                  Consumer<SmoothieTab>(
                    builder: (context, smoothieTab, child) => smoothieTab.buildSmoothieGrid(),
                  ),
                  Consumer<PancakesTab>(
                    builder: (context, pancakesTab, child) => pancakesTab.buildPancakesGrid(),
                  ),
                  Consumer<PizzaTab>(
                    builder: (context, pizzaTab, child) => pizzaTab.buildPizzaGrid(),
                  ),
                ]
              )
            ),
            
            // Cart Section con múltiples proveedores
            Consumer5<DonutTab, BurgerTab, SmoothieTab, PancakesTab, PizzaTab>(
              builder: (context, donutTab, burgerTab, smoothieTab, pancakesTab, pizzaTab, child) {
                // Calculate total items and price
                int totalItems = donutTab.cartItems.length +
                     burgerTab.cartItems.length +
                     smoothieTab.cartItems.length +
                     pancakesTab.cartItems.length +
                     pizzaTab.cartItems.length;
    
                double totalPrice = donutTab.calculateTotal() +
                        burgerTab.calculateTotal() +
                        smoothieTab.calculateTotal() +
                        pancakesTab.calculateTotal() +
                        pizzaTab.calculateTotal();
                        
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$totalItems Items | \$${totalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Delivery Charges Included',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink
                        ),
                        child: const Text(
                          "View Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}