import 'dart:convert';
import 'package:flutter_trainee_test/model/product_model.dart';
import 'package:http/http.dart' as http;

List<ProductsModel> productList = [];

Future<List<ProductsModel>> getProductsApi() async {
    final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> i in data) {
      productList.add(ProductsModel.fromJson(i));
    }
    return productList;
  } else {
    throw Exception('Failed to load data');
  }
}