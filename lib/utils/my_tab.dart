import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  //ruta del archivo del icono
  final String iconPath;
  final String tabName;
  const MyTab({super.key, required this.iconPath, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     Tab(
      height: 50,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Cambia la posición de la sombra
                ),
              ],
        ),
        child: Image.asset(iconPath,
        color: Colors.grey[600],),
      ),
     ),
     Text(tabName,
     style: const TextStyle(fontSize: 10),),
     const SizedBox(height: 5,)
      ],
    );
  }
}