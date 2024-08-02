

import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData( String userName, String password) async {
    var response = await crud.getDataMap("${AppLink.login}/?username=$userName&password=$password");
    return response.fold((l) => l, (r) => r);
  }
}
