import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:product_api_test/prdmodel.dart';

class Homecontroller extends GetxController {
  RxList prdlist = [].obs;
  getprd() async {
    var api = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(api));
    var decode = jsonDecode(response.body);
    var list = decode.map((e) => Prdmodel.fromMap(e)).toList();
    prdlist.clear();
    prdlist.addAll(list);
    print(prdlist);
  }
}
