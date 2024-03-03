
import 'package:bukizz_retailer/mvvm/viewModel/Auth/auth.dart';
import 'package:bukizz_retailer/mvvm/viewModel/orders/orders.dart';
import 'package:bukizz_retailer/mvvm/viewModel/product/product.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'bottom_nav_bar_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
  ChangeNotifierProvider(create: (_) => AuthViewModel()),
  ChangeNotifierProvider(create: (_) => Order()),
  ChangeNotifierProvider(create: (_) => Product()),
];
