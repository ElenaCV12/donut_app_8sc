import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/pancakes_tile.dart';

class PancakesTab extends ChangeNotifier {
  // List of pancakes on sale
  final List _pancakesOnSale = [
    //[pancakeFlavor, pancakePrice, pancakeColor, imageName]
    ["Arándanos", "80", Colors.blue, "lib/images/pancakes/pancakes_cuatro.png"],
    ["Fresa", "85", Colors.red, "lib/images/pancakes/pancakes_cinco.png"],
    ["Miel", "70", Colors.purple, "lib/images/pancakes/pancakes_uno.png"],
    ["Chocolate", "80", Colors.brown, "lib/images/pancakes/pancakes_seis.png"],
    ["Arándanos", "80", Colors.blue, "lib/images/pancakes/pancakes_cuatro.png"],
    ["Fresa-Miel", "85", Colors.red, "lib/images/pancakes/pancakes.png"],
    ["Chocolate-Cereza", "70", Colors.purple, "lib/images/pancakes/pancakes_dos.png"],
    ["Miel-Fresa", "80", Colors.brown, "lib/images/pancakes/pancakes_tres.png"]
  ];

  // List of cart items
  final List _cartItems = [];

  // Getters
  List get pancakesOnSale => _pancakesOnSale;
  List get cartItems => _cartItems;

  // Add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_pancakesOnSale[index]);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Calculate total price
  double calculateTotal() {
  double totalPrice = 0;
  for (int i = 0; i < _cartItems.length; i++) {
    totalPrice += double.parse(_cartItems[i][1]);
  }
  return totalPrice;
}

  // Build method for GridView of pancakes
  Widget buildPancakesGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 1/1.5
      ),
      itemBuilder: (context, index) {
        return PancakesTile(
          pancakeFlavor: _pancakesOnSale[index][0],
          pancakePrice: _pancakesOnSale[index][1],
          pancakeColor: _pancakesOnSale[index][2],
          imageName: _pancakesOnSale[index][3],
          onPressed: () {
            addItemToCart(index);
          },
        );
      },
      itemCount: _pancakesOnSale.length,
    );
  }
}