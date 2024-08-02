import 'dart:convert';

import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';
import 'package:http/http.dart' as http;

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  // getData(String category ) async {
  //   var response = await crud.postData(AppLink.items, {
  //     "category": category,
  //     // "userid": userid.toString(),
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  getData(String category) async {
    var response = await crud.getData(
        "${AppLink.items}/?category=$category");
    return response.fold((l) => l, (r) => r);
  }

  // Future<void> getData(String category) async {
  //   String url = "http://192.168.8.103:9000/courses/byCategory/" + category;

  //   http.get(Uri.parse(url)).then((response) async {
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> response = jsonDecode(response.body);
  //       print(response);
  //       return (response);
  //     } else {
  //       print("Error fetching data");
  //     }
  //   });
  // }
}
