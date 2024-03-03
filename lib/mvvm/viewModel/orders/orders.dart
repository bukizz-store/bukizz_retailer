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

  Order() {
    _fetchOrders();
  }

  bool orderLoaded = true;

  bool get isOrderLoaded => orderLoaded;

  void setOrderLoaded(bool value) {
    orderLoaded = value;
  }

  Future<void> _fetchOrders() async {
    try {
      FirebaseFirestore.instance
          .collection('orderDetails')
          .where('retailerId', isEqualTo: AppConstants.retailer.id)
          .snapshots()
          .listen((snapshot) {
        _orders =
            snapshot.docs.map((doc) => OrderModel.fromFirestore(doc)).toList();
        notifyListeners(); // Notify listeners about the change
      });
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }
}
