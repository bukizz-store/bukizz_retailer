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

  int totalSale = 0;

  int get getTotalSale => totalSale;

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
            for (var doc in snapshot.docs) {
              OrderModel order = OrderModel.fromFirestore(doc);
              totalSale += order.saleAmount.toInt();
              _orders.add(order);
            }
        notifyListeners(); // Notify listeners about the change
      });
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  // void setTotalSale() {
  //   orders.forEach((element) {
  //     totalSale += element.saleAmount.toInt();});
  //   notifyListeners();
  // }
}
