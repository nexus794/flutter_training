// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:retgoo_kick_off/api/api.dart';

class Product {
  Product({
    this.category,
    this.id,
    this.name,
    this.price,
  });

  String category;
  int id;
  String name;
  int price;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        category: json["category"] == null ? null : json["category"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
      };
}

Future<List<Product>> getAllProducts() async {
  final response = await api.get("wsm/products.json");
  if (response.statusCode == 200) {
    final List list = response.data;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  return [];
}

Future<bool> saveProduct(Product data) async {
  final response = await api.post(
    "wsm/add_product.json",
    data: data.toJson(),
  );

  if (response.statusCode == 200 && response.data["success"]) {
    return true;
  }

  return false;
}
