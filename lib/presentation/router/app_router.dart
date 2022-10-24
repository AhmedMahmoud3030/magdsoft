import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product_desc_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/verify_screen.dart';

import '../screens/shared/login_screen.dart';
import '../screens/shared/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String verifyRoute = "/verify";
  static const String homeRoute = "/home";
  static const String helpRoute = "/help";
  static const String productRoute = "/product";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.productRoute:
        return MaterialPageRoute(builder: (_) => ProductDescScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.verifyRoute:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.helpRoute:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      default:
        return null;
    }
  }
}
