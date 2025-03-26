import 'package:flutter/foundation.dart';
import 'package:donut_app_8sc/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends ChangeNotifier {

   //lista de pizzas
  final List _pizzasOnSale = [
    //[pizzaFlavor, pizzaPrice, pizzaColor, imageName]
    ["Pepperoni", "110", Colors.blue, "lib/images/pizza/pizza_ocho.png"],
    ["Champiñon", "120", Colors.red, "lib/images/pizza/pizza_cuatro.png"],
    ["Doble Queso", "150", Colors.purple, "lib/images/pizza/pizza_uno.png"],
    ["Combinada", "175", Colors.brown, "lib/images/pizza/pizza_siete.png"],
    ["Pepperoni", "110", Colors.blue, "lib/images/pizza/pizza_dos.png"],
    ["Pepperoni2", "120", Colors.red, "lib/images/pizza/pizza_seis.png"],
    ["Doble Queso", "150", Colors.purple, "lib/images/pizza/pizza_cinco.png"],
    ["Combinada", "175", Colors.brown, "lib/images/pizza/pizza_tres.png"],
  ];

    // List of cart items
  final List _cartItems = [];

    // Getters
  List get pizzasOnSale => _pizzasOnSale;
  List get cartItems => _cartItems;

  // Add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_pizzasOnSale[index]);
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


  Widget buildPizzaGrid() {
    return  GridView.builder(
      //Como se va a distribuir
      gridDelegate: 
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1/1.5),
        //que elementos tendrá
      itemBuilder: (context, index){
        return PizzaTile (
          pizzaFlavor: pizzasOnSale[index][0],
          pizzaPrice : pizzasOnSale[index][1],
          pizzaColor: pizzasOnSale[index][2],
          imageName: pizzasOnSale[index][3],          
          onPressed: () {
            addItemToCart(index);
          },
        );
      }, // número de items que se mostrarán
      itemCount: pizzasOnSale.length,
      ); // el gridDelgate, es como va organizado todo
  }
}