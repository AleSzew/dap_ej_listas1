import 'package:dap_ej_listas1/entities/users.dart';
import 'package:dap_ej_listas1/go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cree su usuario")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: "Usuario"),
          ),
          TextField(
            controller: passwordController,
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
              if (usernameController.text.isEmpty ||
                  passwordController.text.isEmpty ||
                  emailController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Completa todo")),
                );
                return;
              }

              Users newUser = Users(
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text,
              );

              setState(() {
                globalUsers.add(newUser);
              });

              context.go('/login');
              usernameController.clear();
              emailController.clear();
              passwordController.clear();
            },
            child: Text("Crear usuario"),
          ),
        ],
      ),
    );
  }
}
