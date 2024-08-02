import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_learningplatform/core/class/statusrequest.dart';

import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    //if (await checkInterent()) {
    var response = await http.post(Uri.parse(linkurl), body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailuer);
    }
  }

//   Future<Either<StatusRequest, Map<String, dynamic>>> postData(String linkurl, Map<String, dynamic> data) async {
//   var response = await http.post(Uri.parse(linkurl), body: data);
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     Map<String, dynamic> responseBody = jsonDecode(response.body);
//     print(responseBody);
//     return Right(responseBody);
//   } else {
//     return const Left(StatusRequest.serverFailure);
//   }
// }


  //  else {
  //   return const Left(StatusRequest.offlinefailuer);
  // }
  
  // get data
Future<Either<StatusRequest, List>> getData(String linkurl) async {
  var response = await http.get(Uri.parse(linkurl));
  if (response.statusCode == 200 || response.statusCode == 201) {
    List responseBody = jsonDecode(response.body);
    print(responseBody);
    return Right(responseBody);
  } else {
    return const Left(StatusRequest.serverFailure);
  }
}

//get data map
Future<Either<StatusRequest, Map>> getDataMap(String linkurl) async {
  var response = await http.get(Uri.parse(linkurl));
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map responseBody = jsonDecode(response.body);
    print(responseBody);
    return Right(responseBody);
  } else {
    return const Left(StatusRequest.serverFailure);
  }
}

//remove
Future<Either<StatusRequest, Map>> deleteData(String linkurl, Map data) async {
    //if (await checkInterent()) {
    var response = await http.delete(Uri.parse(linkurl), body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailuer);
    }
  }


  // Future<Either<StatusRequest, Map>> getData(String linkurl, Map data) async {
  //   //if (await checkInterent()) {
  //   var response = await http.get(Uri.parse(linkurl));
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     Map responsebody = jsonDecode(response.body);
  //     print(responsebody);
  //     return Right(responsebody);
  //   } else {
  //     return const Left(StatusRequest.serverfailuer);
  //   }
  // }
 
}
