import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';


class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(String studentId) async {
    var response = await crud.getData("${AppLink.favoriteView}/?student_id=$studentId");
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.deleteData(AppLink.deleteFromeFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
