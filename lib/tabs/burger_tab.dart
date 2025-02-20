import 'package:donut_app_8sc/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
    //lista de hamburguesas
  final List burgersOnSale = [
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


  BurgerTab({super.key});

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
        return BurgerTile (
          burgerFlavor: burgersOnSale[index][0],
          burgerPrice : burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3]
        );
      }, // número de items que se mostrarán
      itemCount: burgersOnSale.length,
      ); // el gridDelgate, es como va organizado todo
  }
}