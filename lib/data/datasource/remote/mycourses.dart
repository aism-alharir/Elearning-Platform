import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class MyCourseData {
  Crud crud;
  MyCourseData(this.crud);

  getData(String studentId) async {
    var response =
        await crud.getData("${AppLink.mycourses}/?student_id=$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
