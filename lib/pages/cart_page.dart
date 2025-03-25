import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app_8sc/tabs/donut_tab.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras')),
      body: Consumer<DonutTab>(
        builder: (context, donutTab, child) {
          return Column(
            children: [
              // Cart Items List
              Expanded(
                child: ListView.builder(
                  itemCount: donutTab.cartItems.length, // Corrected 'length'
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            donutTab.cartItems[index][3], // Corrected image index
                            height: 36,
                          ),
                          title: Text(donutTab.cartItems[index][0]),
                          subtitle: Text('\$${donutTab.cartItems[index][1]}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () => donutTab.removeItemFromCart(index),
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
                    color: Colors.green,
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
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${donutTab.calculateTotal()}',
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
    );
  }
}