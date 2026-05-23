import 'package:dap_ej_listas1/screens/create_user.dart';
import 'package:go_router/go_router.dart';
import 'package:dap_ej_listas1/screens/product_screen.dart';
import 'package:dap_ej_listas1/screens/login.dart';
import 'package:dap_ej_listas1/screens/result.dart';
import 'package:dap_ej_listas1/entities/users.dart';
List<Users> globalUsers = [];
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
  path: '/login',
  builder: (context, state) {
    return login();
  },
),

    GoRoute(
      path: '/home',
      builder: (context, state) => ProductScreen(),
    ),
    GoRoute(
      path: '/createuser',
      builder: (context, state) => CreateUser(),
    ),

    GoRoute(
      path: '/result',
      builder: (context, state) {
        final data = state.extra as Map;
        return ResultScreen(
          masCaro: data['masCaro'],
          masBarato: data['masBarato'],
          promedio: data['promedio'],
           products: data['products'],
        );
      },
    ),


  ],
);

