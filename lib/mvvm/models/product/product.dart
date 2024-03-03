import 'package:bukizz_retailer/mvvm/models/product/variation/set_model.dart';
import 'package:bukizz_retailer/mvvm/models/product/variation/stream_model.dart';
import 'package:bukizz_retailer/mvvm/models/product/variation/variation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String productId;
  String name;
  String description;
  String categoryId;
  String classId;
  String board;
  String retailerId;
  int deliveryCharge;
  List<StreamData> stream;
  List<String> city;
  List<SetData> set;
  List<dynamic> reviewIdList;
  Map<String , dynamic> variation;

  ProductModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.classId,
    required this.board,
    required this.stream,
    required this.set,
    required this.retailerId,
    required this.reviewIdList,
    required this.deliveryCharge,
    required this.variation,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'categoryId': categoryId,
      'classId': classId,
      'board': board,
      'stream': stream.map((x) => x.toMap()).toList(),
      'set': set.map((x) => x.toMap()).toList(),
      'retailerId': retailerId,
      'reviewIdList': reviewIdList,
      'variation': variation,
      'city': city,
      'deliveryCharge': deliveryCharge,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    var variationMap = map['variation'] ?? {};
    Map<String, Map<String, Variation>> convertedVariationMap = {};

    variationMap.forEach((set, setData) {
      convertedVariationMap[set] = {};
      setData.forEach((stream, streamData) {
        convertedVariationMap[set]![stream] = Variation.fromMap(streamData);
      });
    });

    return ProductModel(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      classId: map['classId'] ?? '',
      board: map['board'] ?? '',
      stream: List<StreamData>.from(map['stream']?.map((x) => StreamData.fromMap(x)) ?? []),
      set: List<SetData>.from(map['set']?.map((x) => SetData.fromMap(x)) ?? []),
      retailerId: map['retailerId'] ?? '',
      reviewIdList: List<dynamic>.from(map['reviewIdList'] ?? []),
      variation: convertedVariationMap,
      city: List<String>.from(map['city'] ?? []),
      deliveryCharge: map['deliveryCharge'] ?? 0,
    );
  }

  factory ProductModel.fromGeneralMap(Map<String, dynamic> map) {
    var variationMap = map['variation'] ?? {};
    Map<String, Map<String, Variation>> convertedVariationMap = {};
    int p = 0;

    variationMap.forEach((set) {
      convertedVariationMap[(p).toString()] = {};
      convertedVariationMap[p.toString()]![0.toString()] = Variation.fromMap(set);
      p++;
    });

    return ProductModel(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      classId: '',
      board:  map['brand'] ?? '',
      set: List<SetData>.from(map['variation']?.map((x) => SetData.fromMap(x)) ?? []),
      stream: [],
      retailerId: map['retailerId'] ?? '',
      reviewIdList: List<dynamic>.from(map['reviewIdList'] ?? []),
      variation: convertedVariationMap,
      city: List<String>.from(map['city'] ?? []),
      deliveryCharge: map['deliveryCharge'] ?? 0,
    );
  }

  //fromJson
  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      productId: json['productId'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      categoryId: json['categoryId'] ?? 0,
      classId: json['classId'] ?? '',
      board: json['board'] ?? '',
      stream: List<StreamData>.from(json['stream']?.map((x) => StreamData.fromMap(x))),
      set: List<SetData>.from(json['set']?.map((x) => SetData.fromMap(x))),
      retailerId: json['retailerId'] ?? '',
      reviewIdList: List<dynamic>.from(json['reviewIdList'] ?? []),
      variation:  Map<String , Map<String , Variation>>.from(json['variation'] ?? {}),
      city: List<String>.from(json['city'] ?? []),
      deliveryCharge: json['deliveryCharge'] ?? 0,
    );
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    Map<String, Map<String, Variation>> variationMap = mapVariation(data['variation']);
    return ProductModel(
      productId: data['productId'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      classId: data['classId'] ?? '',
      board: data['board'] ?? '',
      retailerId: data['retailerId'] ?? '',
      stream: List<StreamData>.from(data['stream'].map((x) => StreamData.fromJson(x))) ?? [],
      set: List<SetData>.from(data['set'].map((x) => SetData.fromJson(x))) ?? [],
      reviewIdList: List<dynamic>.from(data['reviewIdList']) ?? [],
      variation: variationMap ?? {},
      city: List<String>.from(data['city']) ?? [],
      deliveryCharge: data['deliveryCharge'] ?? 0,
    );
  }

  static Map<String, Map<String, Variation>> mapVariation(Map<String, dynamic> data) {
    Map<String, Map<String, Variation>> result = {};
    data.forEach((key, value) {
      Map<String, dynamic> variationMap = value as Map<String, dynamic>;
      Map<String, Variation> variation = {};
      variationMap.forEach((variationKey, variationValue) {
        variation[variationKey] = Variation.fromJson(variationValue);
      });
      result[key] = variation;
    });

    return result;
  }

  //fromFirestore
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var variationMap = Map<String, Map<String, Variation>>.from(data['variation']);

    return ProductModel(
      productId: data['productId'],
      name: data['name'],
      description: data['description'],
      categoryId: data['categoryId'],
      classId: data['classId'],
      board: data['board'],
      retailerId: data['retailerId'],
      stream: List<StreamData>.from(data['stream'].map((x) => StreamData.fromMap(x))),
      set: List<SetData>.from(data['set'].map((x) => SetData.fromMap(x))),
      reviewIdList: List<dynamic>.from(data['reviewIdList']),
      variation: variationMap,
      city: List<String>.from(data['city']),
      deliveryCharge: data['deliveryCharge'],
    );
  }

}