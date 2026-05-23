import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dap_ej_listas1/entities/users.dart';
import 'package:dap_ej_listas1/go_router/go_router.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicie sesion")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: userController,
            decoration: InputDecoration(labelText: "Usuario"),
          ),
          TextField(
            controller: passController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Contraseña"),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (userController.text.isEmpty ||
                  passController.text.isEmpty ||
                  emailController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Completa todo")),
                );
                return;
              }

              int validation = 0;
              for (Users i in globalUsers) {
                if (i.username == userController.text &&
                    i.password == passController.text &&
                    i.email == emailController.text) {
                  validation = 1;
                }
              }

              if (validation == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Login correcto")),
                );
                context.go('/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Login incorrecto")),
                );
              }
            },
            child: Text("Ingresar"),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/createuser');
            },
            child: Text("Crear nuevo usuario"),
          ),
        ],
      ),
    );
  }
}
