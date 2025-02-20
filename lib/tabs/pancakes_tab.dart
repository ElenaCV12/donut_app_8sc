import 'package:donut_app_8sc/utils/pancakes_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {

    //lista de Pancakes
  final List pancakesOnSale = [
    //[pancakeFlavor, pancakePrice, pancakeColor, imageName]
    ["Arándanos", "80", Colors.blue, "lib/images/pancakes/pancakes_cuatro.png"],
    ["Fresa", "85", Colors.red, "lib/images/pancakes/pancakes_cinco.png"],
    ["Miel", "70", Colors.purple, "lib/images/pancakes/pancakes_uno.png"],
    ["Chocolate", "80", Colors.brown, "lib/images/pancakes/pancakes_seis.png"],    ["Arándanos", "80", Colors.blue, "lib/images/pancakes/pancakes_cuatro.png"],
    ["Fresa-Miel", "85", Colors.red, "lib/images/pancakes/pancakes.png"],
    ["Chocolate-Cereza", "70", Colors.purple, "lib/images/pancakes/pancakes_dos.png"],
    ["Miel-Fresa", "80", Colors.brown, "lib/images/pancakes/pancakes_tres.png"]
  ];

  PancakesTab({super.key});

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
        return PancakesTile (
          pancakeFlavor: pancakesOnSale[index][0],
          pancakePrice : pancakesOnSale[index][1],
          pancakeColor: pancakesOnSale[index][2],
          imageName: pancakesOnSale[index][3]
        );
      }, // número de items que se mostrarán
      itemCount: pancakesOnSale.length,
      ); // el gridDelgate, es como va organizado todo
  }
}