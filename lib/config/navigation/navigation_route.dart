// ignore_for_file: unrelated_type_equality_checks

import 'package:go_router/go_router.dart';
import 'package:rapid_chain/presentation/view/auth/login/view/login_view.dart';
import 'package:rapid_chain/presentation/view/auth/register/view/register_view.dart';
import 'package:rapid_chain/presentation/view/auth/splash/view/splash_view.dart';
import 'package:rapid_chain/presentation/view/home/view/home_view.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';

final router = GoRouter(
  initialLocation: NavigationConstant.MAIN,
  routes: [
    GoRoute(
      name: NavigationConstant.MAIN,
      path: NavigationConstant.MAIN,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: NavigationConstant.LOGIN,
      path: NavigationConstant.LOGIN,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: NavigationConstant.REGISTER,
      path: NavigationConstant.REGISTER,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      name: NavigationConstant.HOME,
      path: NavigationConstant.HOME,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
