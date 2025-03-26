import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  final String burgerFlavor;
  final String burgerPrice;
  final dynamic burgerColor;
  final String imageName;
  final void Function()? onPressed;

  //valor fijo del borde circular
  final double borderRadius = 24;

  const BurgerTile({super.key, required this.burgerFlavor, required this.burgerPrice, this.burgerColor, required this.imageName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        // Agregamos un tamaño fijo al container para evitar desbordamiento
        width: 200,
        height: 240,
        decoration: BoxDecoration(
          color: burgerColor[50],
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
                  color: burgerColor[100],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRadius), 
                                                  topRight: Radius.circular(borderRadius)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text('\$$burgerPrice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: burgerColor[800],
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
                burgerFlavor,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: burgerColor[800],
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
                        backgroundColor: burgerColor[200],
                        foregroundColor: burgerColor[800],
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