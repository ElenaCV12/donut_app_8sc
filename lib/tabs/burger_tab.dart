import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/burger_tile.dart';

class BurgerTab extends ChangeNotifier {
  // List of burgers on sale
  final List _burgersOnSale = [
    //[burgerFlavor, burgerPrice, burgerColor, imageName]
    ["Burger Uno", "100", Colors.blue, "lib/images/burger/burger_uno.png"],
    ["Burger Dos", "105", Colors.red, "lib/images/burger/burger_dos.png"],
    ["Vegan Burger", "120", Colors.purple, "lib/images/burger/vegan_burger.png"],
    ["Burger Combo1", "150", Colors.brown, "lib/images/burger/burger_combo.png"],
    ["Burger Combo2", "100", Colors.blue, "lib/images/burger/burger_comboo.png"],
    ["Burger Tres", "105", Colors.red, "lib/images/burger/burger_dos.png"],
    ["Color Burger", "120", Colors.purple, "lib/images/burger/color_burguer.png"],
    ["Burger Combo3", "150", Colors.brown, "lib/images/burger/burguer_combooo.png"],
  ];

  // List of cart items
  final List _cartItems = [];

  // Getters
  List get burgersOnSale => _burgersOnSale;
  List get cartItems => _cartItems;

  // Add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_burgersOnSale[index]);
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

  // Build method for GridView of burgers
  Widget buildBurgerGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 1/1.5
      ),
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: _burgersOnSale[index][0],
          burgerPrice: _burgersOnSale[index][1],
          burgerColor: _burgersOnSale[index][2],
          imageName: _burgersOnSale[index][3],
          onPressed: () {
            addItemToCart(index);
          },
        );
      },
      itemCount: _burgersOnSale.length,
    );
  }
}