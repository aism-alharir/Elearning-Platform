import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class AssimentData {
  Crud crud;
  AssimentData(this.crud);

  getData(String courseid) async {
    var response =
        await crud.getData("${AppLink.server}/quizzes/quizzes/?course=$courseid");
    return response.fold((l) => l, (r) => r);
  }

  
}
