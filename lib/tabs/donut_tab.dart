import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/donut_tile.dart';

class DonutTab extends ChangeNotifier {
  // List of donuts on sale
  final List _donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Chocolate", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Menta", "55", Colors.blue, "lib/images/donut_menta.png"],
    ["Pistacho", "50", Colors.red, "lib/images/donut_pistacho.png"],
    ["Mapple", "60", Colors.purple, "lib/images/donut_mapple.png"],
    ["Red Velvet", "70", Colors.brown, "lib/images/donut_redvelvet.png"],
  ];

  // List of cart items
  final List _cartItems = [];

  // Getters
  List get donutsOnSale => _donutsOnSale;
  List get cartItems => _cartItems;

  // Add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_donutsOnSale[index]);
    notifyListeners(); // Important to update UI
  }

  // Remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners(); // Important to update UI
  }

  // Calculate total price
 double calculateTotal() {
  double totalPrice = 0;
  for (int i = 0; i < _cartItems.length; i++) {
    totalPrice += double.parse(_cartItems[i][1]);
  }
  return totalPrice;
}

  // Build method for GridView of donuts
  Widget buildDonutGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 1/1.5
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: _donutsOnSale[index][0],
          donutPrice: _donutsOnSale[index][1],
          donutColor: _donutsOnSale[index][2],
          imageName: _donutsOnSale[index][3],
          onPressed: () {
            addItemToCart(index);
          },
        );
      },
      itemCount: _donutsOnSale.length,
    );
  }
}