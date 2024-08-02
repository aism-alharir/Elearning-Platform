import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class CourseData {
  Crud crud;
  CourseData(this.crud);

  getData() async {
    var response = await crud.getData(AppLink.hpmePage);
    return response.fold((l) => l, (r) => r);
  }

  getCategory() async {
    var response = await crud.getData(AppLink.category);
    return response.fold((l) => l, (r) => r);
  }
}
