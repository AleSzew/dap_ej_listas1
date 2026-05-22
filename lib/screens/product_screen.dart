import 'package:dap_ej_listas1/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();


  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nombre",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Descripcion",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Precio",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Product newProduct = Product(
                  name: nameController.text,
                  description: descriptionController.text,
                  price: double.parse(priceController.text),
                );

                setState(() {
                  products.add(newProduct);
                });

                nameController.clear();
                descriptionController.clear();
                priceController.clear();


              },
              child: Text("Ingresar"),
            ),


            SizedBox(height: 20),


            ElevatedButton(
              onPressed: () {
                Product masCaro = products[0];
                Product masBarato = products[0];

                double total = 0;

                for (Product p in products) {

                  if (p.price > masCaro.price) {
                    masCaro = p;
                  }

                  if (p.price < masBarato.price) {
                    masBarato = p;
                  }
                  total = total + p.price;
                }
                double promedio = total / products.length;


                context.push(
                  '/result',
                  extra: {
                    'masCaro': masCaro,
                    'masBarato': masBarato,
                    'promedio': promedio,
                    'products': products,
                  },
                );
              },
              child: Text("Calcular"),
            ),


          ],
        ),
      ),
    );
  }
}
