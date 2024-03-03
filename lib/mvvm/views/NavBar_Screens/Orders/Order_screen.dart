import 'package:bukizz_retailer/constants/images.dart';
import 'package:bukizz_retailer/mvvm/views/NavBar_Screens/Orders/pending/Rest_others.dart';
import 'package:bukizz_retailer/mvvm/views/NavBar_Screens/Orders/pending/pending_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        bottom: TabBar(
          physics: AlwaysScrollableScrollPhysics(),
          tabAlignment:TabAlignment.start,
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.transparent),
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(text: 'Pending',),
            Tab(text: 'Out for Delivery'),
            Tab(text: 'Delivered'),
            Tab(text: 'Redelivery'),
            Tab(text: 'Canceled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PendingOrderTabs(),
          OrderTabs(),
          OrderTabs(),
          OrderTabs(),
          OrderTabs()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

