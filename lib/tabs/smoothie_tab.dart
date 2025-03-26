import 'package:flutter/foundation.dart';
import 'package:donut_app_8sc/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends ChangeNotifier {

    //lista de smoothies
  final List _smoothiesOnSale = [
    //[smoothieFlavor, smoothiePrice, smoothieColor, imageName]
    ["Fresa", "75", Colors.blue, "lib/images/smoothhie/smoothie_fresa.png"],
    ["Naranja", "70", Colors.red, "lib/images/smoothhie/smoothie_naranja.png"],
    ["Uva", "75", Colors.purple, "lib/images/smoothhie/smoothie_uvaa.png"],
    ["Chocolate", "70", Colors.brown, "lib/images/smoothhie/smoothie_choco.png"],
    ["Fresa-Plátano", "85", Colors.blue, "lib/images/smoothhie/smoothie_fresabanana.png"],
    ["Plátano", "65", Colors.red, "lib/images/smoothhie/smoothie_banana.png"],
    ["Uva-Fresa", "75", Colors.purple, "lib/images/smoothhie/smoothie_uvafresa.png"],
    ["Aguacate", "80", Colors.brown, "lib/images/smoothhie/smoothie_aguacate.png"],
  ];

  //list of cart items
  final List _cartItems = [];

  List get smoothiesOnSale => _smoothiesOnSale;
  List get cartItems => _cartItems;

    // Add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_smoothiesOnSale[index]);
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



  Widget buildSmoothieGrid() {
    return  GridView.builder(
      //Como se va a distribuir
      gridDelegate: 
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1/1.5),
        //que elementos tendrá
      itemBuilder: (context, index){
        return SmoothieTile (
          smoothieFlavor: smoothiesOnSale[index][0],
          smoothiePrice : smoothiesOnSale[index][1],
          smoothieColor: smoothiesOnSale[index][2],
          imageName: smoothiesOnSale[index][3],
          onPressed: () {
            addItemToCart(index);
          },
        );
      }, // número de items que se mostrarán
      itemCount: smoothiesOnSale.length,
      ); // el gridDelgate, es como va organizado todo
  }
}