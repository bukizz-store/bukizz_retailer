import 'package:bukizz_retailer/mvvm/models/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../constants/constants.dart';

class Product extends ChangeNotifier {
  Product() {
    _fetchProducts();
  }

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> _fetchProducts() async {
    try {
      FirebaseFirestore.instance
          .collection('products')
          .where('retailerId', isEqualTo: AppConstants.retailer.id)
          .snapshots()
          .listen((snapshot) {
        _products = snapshot.docs
            .map((doc) => ProductModel.fromSnapshot(doc))
            .toList();
        notifyListeners(); // Notify listeners about the change
      });
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }
}
