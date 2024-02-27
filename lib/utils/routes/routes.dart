import 'package:bukizz_retailer/mvvm/views/Auth/Login/login.dart';
import 'package:bukizz_retailer/mvvm/views/Auth/forgotPassword.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.route:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case ForgotPasswordScreen.route:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error: Invalid route'),
        ),
      ),
    );
  }
}
