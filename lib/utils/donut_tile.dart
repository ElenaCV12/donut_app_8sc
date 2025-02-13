import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String imageName;

  //valor fijo del borde circular
  final double borderRadius = 24;

  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, this.donutColor, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            //precio
            Row(
              //Alinear el texto a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                decoration: BoxDecoration(
                  color: donutColor[100],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRadius), 
                                                  topRight: Radius.circular(borderRadius)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text('\$$donutPrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: donutColor[800],
                ),
              ),
          )
              ],
          ),

          //imagen del producto
          Padding(padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    child: Image.asset(imageName)
          ),

          //Texto del sabor del producto--TAREA

          //Iconos de me encanta y agregar---TAREA

          ],
        ),
      ),
    );
  }
}