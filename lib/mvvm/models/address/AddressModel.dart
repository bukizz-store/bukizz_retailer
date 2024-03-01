class Address{
  String shopNo;
  String street;
  String city;
  String state;
  String pinCode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.pinCode,
    required this.shopNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'shopNo': shopNo,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      pinCode: map['pinCode'] ?? '',
      shopNo: map['shopNo'] ?? '',
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'shopNo': shopNo,
    };
  }
  //fromJson
  factory Address.fromJson(Map<String, dynamic> map) => Address.fromMap(map);

  @override
  String toString() {
    return 'Address{shopNo: $shopNo, street: $street, city: $city, state: $state, pinCode: $pinCode}';
  }
}