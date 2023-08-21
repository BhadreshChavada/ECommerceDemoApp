import 'dart:convert';
import 'dart:developer';

import 'package:employee/view/network/Constant.dart';

import '../model/ProductResponse.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<ProductResponse?> getProducts() async {
    try {
      var url = Uri.parse(Constant.baseUrl + Constant.products);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = await json.decode(response.body);
        ProductResponse model = ProductResponse.fromJson(data);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}