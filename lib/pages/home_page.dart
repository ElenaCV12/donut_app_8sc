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
    //donut tab
    const MyTab(iconPath: 'lib/icons/donut.png', tabName: 'Donuts'),
    //burger tab
    const MyTab(iconPath: 'lib/icons/burger.png', tabName: 'Burger'),
    //smoothie tab
    const MyTab(iconPath: 'lib/icons/smoothie.png', tabName: 'Smoothie'),
    //pancakes tab
    const MyTab(iconPath: 'lib/icons/pancakes.png', tabName: 'Pancakes'),
    //pizza tab
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
                icon: Icon(Icons.person)
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
            // Tab Bar for menu items
            TabBar(
              tabs: myTabs,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
            ),
            // Tab Bar view
            Expanded(
              child: TabBarView(
                children: [
                  // Use Consumer for DonutTab
                  Consumer<DonutTab>(
                    builder: (context, donutTab, child) {
                      return donutTab.buildDonutGrid();
                    },
                  ),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab(),
                ]
              )
            ),
            
            // Cart Section
            Consumer<DonutTab>(
              builder: (context, donutTab, child) {
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
                              "${donutTab.cartItems.length} Items | \$${donutTab.calculateTotal()}",
                              style: TextStyle(
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
            )
          ],
        ),
      ),
    );
  }
}