
import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String usersid, String courseid) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "student": usersid,
      "course": courseid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String courseid) async {
    var response = await crud.deleteData(AppLink.favoriteRemove, {
      "student_id": usersid,
      "course_id": courseid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
