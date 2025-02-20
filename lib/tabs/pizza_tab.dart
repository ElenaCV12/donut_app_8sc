import 'package:donut_app_8sc/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {

   //lista de pizzas
  final List pizzasOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Pepperoni", "110", Colors.blue, "lib/images/pizza/pizza_ocho.png"],
    ["Champiñon", "120", Colors.red, "lib/images/pizza/pizza_cuatro.png"],
    ["Doble Queso", "150", Colors.purple, "lib/images/pizza/pizza_uno.png"],
    ["Combinada", "175", Colors.brown, "lib/images/pizza/pizza_siete.png"],
    ["Pepperoni", "110", Colors.blue, "lib/images/pizza/pizza_dos.png"],
    ["Pepperoni2", "120", Colors.red, "lib/images/pizza/pizza_seis.png"],
    ["Doble Queso", "150", Colors.purple, "lib/images/pizza/pizza_cinco.png"],
    ["Combinada", "175", Colors.brown, "lib/images/pizza/pizza_tres.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return  
    GridView.builder(
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
          imageName: pizzasOnSale[index][3]
        );
      }, // número de items que se mostrarán
      itemCount: pizzasOnSale.length,
      ); // el gridDelgate, es como va organizado todo
  }
}