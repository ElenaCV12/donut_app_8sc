import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String imageName;

  //valor fijo del borde circular
  final double borderRadius = 24;
  final void Function()? onPressed;

  const PizzaTile({super.key, required this.pizzaFlavor, required this.pizzaPrice, this.pizzaColor, required this.imageName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        // Agregamos un tamaño fijo al container para evitar desbordamiento
        width: 200,
        height: 240,
        decoration: BoxDecoration(
          color: pizzaColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
           mainAxisSize: MainAxisSize.min, // Minimiza el espacio vertical
          children: [
            //precio
            Row(
              //Alinear el texto a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                decoration: BoxDecoration(
                  color: pizzaColor[100],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRadius), 
                                                  topRight: Radius.circular(borderRadius)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text('\$$pizzaPrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: pizzaColor[800],
                ),
              ),
          )
              ],
          ),

          //imagen del producto
           Expanded( // Wrapped in Expanded
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Reducido el padding
                child: Image.asset(
                  imageName,
                  fit: BoxFit.contain, // Asegura que la imagen se ajuste
                )
              ),
            ),

          //Texto del sabor del producto--TAREA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                pizzaFlavor,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: pizzaColor[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 6),

          //Iconos de me encanta y agregar---TAREA
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    constraints: const BoxConstraints(), // Minimiza el padding del IconButton
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.pink,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                  
                  SizedBox(
                    height: 30, // Altura fija para el botón
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pizzaColor[200],
                        foregroundColor: pizzaColor[800],
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius/2),
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                    ),
                  ),
                ),
             ],
           ),
         ),
       ],
     ),
    ),
  );
}
}