import 'package:forms_app/features/bloc_counter/screens/bloc_counter_screen.dart';
import 'package:forms_app/features/cubit_couter/screens/cubit_counter_screen.dart';
import 'package:forms_app/features/home/screens/home_screen.dart';
import 'package:forms_app/features/register/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubit-counter',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: '/bloc-counter',
      builder: (context, state) => const BlocCounterScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
