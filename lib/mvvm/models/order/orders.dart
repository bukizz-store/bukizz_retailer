import '../address/AddressModel.dart';

class OrderModel{
  String orderId;
  String userId;
  String orderDate;
  String orderName;
  double totalAmount;
  double saleAmount;
  int deliveryCharge;
  Address address;
  Map<String , dynamic> cartData;
  int cartLength;
  String status;
  String reviewId;
  String retailerId;
  String transactionId;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.orderDate,
    required this.orderName,
    required this.totalAmount,
    required this.saleAmount,
    required this.deliveryCharge,
    required this.address,
    required this.cartData,
    required this.cartLength,
    required this.status,
    required this.reviewId,
    required this.retailerId,
    required this.transactionId,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'orderDate': orderDate,
      'orderName': orderName,
      'totalAmount': totalAmount,
      'saleAmount': saleAmount,
      'deliveryCharge': deliveryCharge,
      'address': address.toMap(),
      'cartData': cartData,
      'cartLength': cartLength,
      'status': status,
      'reviewId': reviewId,
      'retailerId': retailerId,
      'transactionId': transactionId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] ?? '',
      userId: map['userId'] ?? '',
      orderDate: map['orderDate'] ?? '',
      orderName: map['orderName'] ?? '',
      totalAmount: map['totalAmount'] ?? 0.0,
      saleAmount: map['saleAmount'] ?? 0.0,
      deliveryCharge: map['deliveryCharge'] ?? 0,
      address: Address.fromMap(map['address']),
      cartData: map['cartData'],
      cartLength: map['cartLength'] ?? 0,
      status: map['status'] ?? '',
      reviewId: map['reviewId'] ?? '',
      retailerId: map['retailerId'] ?? '',
      transactionId: map['transactionId'] ?? '',
    );
  }

}