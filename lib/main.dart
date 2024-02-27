import 'package:bukizz_retailer/constants/theme.dart';
import 'package:bukizz_retailer/mvvm/views/Auth/Login/login.dart';
import 'package:bukizz_retailer/utils/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        initialRoute: SignInScreen.route,
        onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.lightThemeData,
    );
  }
}

