import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app_8sc/tabs/donut_tab.dart';
import 'package:donut_app_8sc/tabs/pizza_tab.dart';
import 'package:donut_app_8sc/tabs/burger_tab.dart';
import 'package:donut_app_8sc/tabs/smoothie_tab.dart';
import 'package:donut_app_8sc/tabs/pancakes_tab.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras')),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Provider.of<DonutTab>(context)),
          ChangeNotifierProvider.value(value: Provider.of<PizzaTab>(context)),
          ChangeNotifierProvider.value(value: Provider.of<BurgerTab>(context)),
          ChangeNotifierProvider.value(value: Provider.of<SmoothieTab>(context)),
          ChangeNotifierProvider.value(value: Provider.of<PancakesTab>(context)),
        ],
        child: Consumer5<DonutTab, PizzaTab, BurgerTab, SmoothieTab, PancakesTab>(
          builder: (context, donutTab, pizzaTab, burgerTab, smoothieTab, pancakesTab, child) {
            // Combinar todos los carritos
            final allCartItems = [
              ...donutTab.cartItems.map((item) => {
                'name': item[0],
                'price': item[1],
                'description': item[2],
                'image': item[3],
                'category': 'Donuts',
                'removeMethod': (int index) => donutTab.removeItemFromCart(index)
              }),
              ...pizzaTab.cartItems.map((item) => {
                'name': item[0],
                'price': item[1],
                'description': item[2],
                'image': item[3],
                'category': 'Pizzas',
                'removeMethod': (int index) => pizzaTab.removeItemFromCart(index)
              }),
              ...burgerTab.cartItems.map((item) => {
                'name': item[0],
                'price': item[1],
                'description': item[2],
                'image': item[3],
                'category': 'Burgers',
                'removeMethod': (int index) => burgerTab.removeItemFromCart(index)
              }),
              ...smoothieTab.cartItems.map((item) => {
                'name': item[0],
                'price': item[1],
                'description': item[2],
                'image': item[3],
                'category': 'Smoothies',
                'removeMethod': (int index) => smoothieTab.removeItemFromCart(index)
              }),
              ...pancakesTab.cartItems.map((item) => {
                'name': item[0],
                'price': item[1],
                'description': item[2],
                'image': item[3],
                'category': 'Pancakes',
                'removeMethod': (int index) => pancakesTab.removeItemFromCart(index)
              }),
            ];

            return Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    itemCount: allCartItems.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      final item = allCartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              item['image'],
                              height: 36,
                            ),
                            title: Text('${item['name']} (${item['category']})'),
                            subtitle: Text('\$${item['price']}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                // Eliminar del carrito correspondiente
                                // Encuentra el índice correcto en el carrito original
                                final originalIndex = allCartItems[index]['category'] == 'Donuts'
                                  ? donutTab.cartItems.indexWhere((cartItem) => 
                                      cartItem[0] == item['name'] && cartItem[1] == item['price'])
                                  : allCartItems[index]['category'] == 'Pizzas'
                                  ? pizzaTab.cartItems.indexWhere((cartItem) => 
                                      cartItem[0] == item['name'] && cartItem[1] == item['price'])
                                  : allCartItems[index]['category'] == 'Burgers'
                                  ? burgerTab.cartItems.indexWhere((cartItem) => 
                                      cartItem[0] == item['name'] && cartItem[1] == item['price'])
                                  : allCartItems[index]['category'] == 'Smoothies'
                                  ? smoothieTab.cartItems.indexWhere((cartItem) => 
                                      cartItem[0] == item['name'] && cartItem[1] == item['price'])
                                  : pancakesTab.cartItems.indexWhere((cartItem) => 
                                      cartItem[0] == item['name'] && cartItem[1] == item['price']);

                                // Llama al método de eliminación correcto
                                item['removeMethod'](originalIndex);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Total Price and Pay Now Section
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${_calculateOverallTotal(donutTab, pizzaTab, burgerTab, smoothieTab, pancakesTab)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        
                        // Pay Now Button
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                "Pay Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  // Método para calcular el total de todos los carritos
  double _calculateOverallTotal(
    DonutTab donutTab, 
    PizzaTab pizzaTab, 
    BurgerTab burgerTab, 
    SmoothieTab smoothieTab, 
    PancakesTab pancakesTab
  ) {
    return donutTab.calculateTotal() + 
           pizzaTab.calculateTotal() + 
           burgerTab.calculateTotal() + 
           smoothieTab.calculateTotal() + 
           pancakesTab.calculateTotal();
  }
}