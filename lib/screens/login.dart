
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dap_ej_listas1/entities/users.dart';

class login extends StatefulWidget {
  final List<Users> users;   // recibe la lista
  const login({super.key, required this.users});
  @override
  State<login> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<login> {
   @override
    Widget build(BuildContext context) {
  String title = "Inicie sesion";

  int validation = 0;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userController,
                decoration:  InputDecoration(
                  labelText: "Usuario",
                ),
              ),
              TextField(
                controller: passController,
                decoration:  InputDecoration(
                  labelText: "Contraseña",
                )
              ),
              TextField(
                controller: emailController,
                decoration:  InputDecoration(
                  labelText: "Email",
                ),
              ),
               SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (userController.text.isEmpty || passController.text.isEmpty || emailController.text.isEmpty ){
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text("Completa todo")),
                    );
                  } 
                for (Users i in widget.users) {
                  if ( i.username == userController.text && i.password == passController.text && i.email == emailController.text) {
                  validation = 1;
                     }
                    }
                 if (validation == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login correcto")),
                 );
                context.go('/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text("Login incorrecto")),
                );
                }
                },
                child:  Text("Ingresar"),
              ),
              ElevatedButton(
                onPressed:() {
                  context.push ('/createuser');
                },   
              child: Text("Crear nuevo usuario"))
            ],
          ),
      );
  }
}