import 'package:dap_ej_listas1/entities/users.dart';
import 'package:dap_ej_listas1/go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});
  @override
  State<CreateUser> createState() => _CreateUserState();
}

class  _CreateUserState extends State<CreateUser> {

   @override
    Widget build(BuildContext context) {
  String title = "Cree su usuario";


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
  
    return Scaffold(
      appBar: AppBar(title: Text(title)),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration:  InputDecoration(
                  labelText: "Usuario",
                ),
              ),
              TextField(
                controller: passwordController,
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
                Users newUser = Users(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text
                );

                setState(() {
                  globalUsers.add(newUser);

                });
                 context.go('/login', extra: globalUsers);
                usernameController.clear();
                emailController.clear();
                passwordController.clear();

              },
                child:  Text("Crear usuario"),
              ),
              
            ],
          ),
      );
  }
}