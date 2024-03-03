import 'package:bukizz_retailer/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/order/orders.dart';

class Order extends ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  void addOrder(OrderModel order) {
    _orders.add(order);
    notifyListeners();
  }

  bool orderLoaded = true;

  bool get isOrderLoaded => orderLoaded;

  void setOrderLoaded(bool value) {
    orderLoaded = value;
  }

  Future<void> fetchOrders() async {
    orderLoaded = false;
    FirebaseFirestore.instance.collection('orderDetails').where('retailerId', isEqualTo: AppConstants.retailer.id).get().then((value) {
      _orders = value.docs.map((e) => OrderModel.fromMap(e.data())).toList();
    });
    orderLoaded = true;
  }
}