import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class MyQuizeData {
  Crud crud;
  MyQuizeData(this.crud);

  getData(String quizeid) async {
    var response =
        await crud.getData("${AppLink.server}/?student_id=$quizeid");
    return response.fold((l) => l, (r) => r);
  }
}
