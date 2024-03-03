
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants/images.dart';
import '../../../constants/colors.dart';
import '../../../providers/bottom_nav_bar_provider.dart';
import '../NavBar_Screens/DashBBoard_Screen.dart';
import '../NavBar_Screens/Notification_Screen.dart';
import '../NavBar_Screens/Orders/Order_screen.dart';
import '../NavBar_Screens/Product_screen.dart';
import '../NavBar_Screens/Wallet_Screen.dart';


class MainScreen extends StatefulWidget {
  static const String route = '/mainscreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(builder: (context , bottomProvider , child){
      return Scaffold(
          body: _buildCurrentScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items:<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImage.homeIcon,color: context.watch<BottomNavigationBarProvider>().selectedIndex == 0 ? AppColors.productButtonSelectedBorder : AppColors.schoolTextColor,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImage.cartIcon, color: context.watch<BottomNavigationBarProvider>().selectedIndex == 1 ? AppColors.productButtonSelectedBorder : AppColors.schoolTextColor,),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImage.notificationIcon,color: context.watch<BottomNavigationBarProvider>().selectedIndex == 2 ? AppColors.productButtonSelectedBorder : AppColors.schoolTextColor,),
                label: 'Notification',

              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImage.categoriesIcons, color: context.watch<BottomNavigationBarProvider>().selectedIndex == 3 ? AppColors.productButtonSelectedBorder : AppColors.schoolTextColor,),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImage.walletIcon, color: context.watch<BottomNavigationBarProvider>().selectedIndex == 4 ? AppColors.productButtonSelectedBorder : AppColors.schoolTextColor),
                label: 'Wallet',
              ),

            ],
            unselectedItemColor: AppColors.schoolTextColor,
            unselectedFontSize: 10,
            selectedFontSize: 12,
            selectedItemColor: AppColors.productButtonSelectedBorder,
            currentIndex: bottomProvider.selectedIndex,
            showUnselectedLabels: true,
            onTap: bottomProvider.setSelectedIndex,
            type: BottomNavigationBarType.fixed,
          )
      );
    },);
  }


  Widget _buildCurrentScreen() {
    switch (context.watch<BottomNavigationBarProvider>().selectedIndex) {
      case 0:
        return DashBoardScreen();
      case 1:
        return  OrderScreen();
      case 2:
        return const NotificationScreen();
      case 3:
        return const ProductScreen();
      case 4:
        return const WalletScreen();
      default:
        return Container();
    }
  }
}

