import 'package:e_learningplatform/data/model/login/meta_data.dart';
import 'package:e_learningplatform/data/model/login/user_model.dart';


class UserResponse {
   late MetaData metaData;
   late User data;

  UserResponse();

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    UserResponse userResponse = UserResponse();

    userResponse.metaData = MetaData.fromJson(json['meta_data']);

    if (json['data'] != null) userResponse.data = User.fromJson(json['data']);

    return userResponse;
  }
}