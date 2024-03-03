import 'package:bukizz_retailer/constants/constants.dart';
import 'package:bukizz_retailer/constants/theme.dart';
import 'package:bukizz_retailer/mvvm/models/Auth/RetailerModel.dart';
import 'package:bukizz_retailer/mvvm/views/NavBar/NavBar.dart';
import 'package:bukizz_retailer/providers/provider.dart';
import 'package:bukizz_retailer/mvvm/views/Auth/Login/login.dart';
import 'package:bukizz_retailer/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RetailerModel.fetchFromSharedPref();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType){
      return MultiProvider(
        providers: providers,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SignInScreen.route,
            onGenerateRoute: RouteGenerator.generateRoute,
          theme: AppTheme.lightThemeData,
        ));
      }
    );
  }
}

