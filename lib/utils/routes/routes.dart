import 'package:bukizz_retailer/mvvm/views/Auth/Login/login.dart';
import 'package:bukizz_retailer/mvvm/views/Auth/SignUp/signUP_screen.dart';
import 'package:bukizz_retailer/mvvm/views/Auth/forgotPassword.dart';
import 'package:bukizz_retailer/mvvm/views/ContactUs/contact_us.dart';
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
      case ContactUsScreen.route:
        return MaterialPageRoute(
          builder: (_) =>  ContactUsScreen(),
        );
      case SignUpScreen.route:
        return MaterialPageRoute(
          builder: (_) => const  SignUpScreen(),
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
