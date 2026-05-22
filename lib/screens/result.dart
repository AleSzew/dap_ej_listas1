import 'package:dap_ej_listas1/entities/product.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final Product masCaro;
  final Product masBarato;
  final double promedio;

final List<Product> products;

   ResultScreen({
    super.key,
    required this.masCaro,
    required this.masBarato,
    required this.promedio,
    required this.products,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultados")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Producto mas caro",
              style: TextStyle(fontSize: 25),
            ),
            Text("Nombre: ${masCaro.name}"),
            Text("Descripcion: ${masCaro.description}"),
            Text("Precio: ${masCaro.price}"),

            SizedBox(height: 40),
            Text(
              "Producto mas barato",
              style: TextStyle(fontSize: 25),
            ),

            Text("Nombre: ${masBarato.name}"),
            Text("Descripcion: ${masBarato.description}"),
            Text("Precio: ${masBarato.price}"),

            SizedBox(height: 40),
            Text(
              "Promedio: $promedio",
              style: TextStyle(fontSize: 25),
            ),
          Expanded(
  child: ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
      final producto = products[index];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nombre: ${producto.name}"),
          Text("Precio: ${producto.price}"),
          Text("Descripción: ${producto.description}"),
          Divider(),
        ],
      );
    },
  ),
)


          ],
        ),
      ),
    );
  }
}
