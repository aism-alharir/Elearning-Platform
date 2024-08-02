

import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String username,String email, String password) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "email": email,
      "password": password
      
      // "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
