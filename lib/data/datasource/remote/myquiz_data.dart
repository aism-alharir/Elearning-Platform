import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class MyQuizData {
  Crud crud;
  MyQuizData(this.crud);

  getData(String quizeid) async {
    var response =
        await crud.getData("${AppLink.server}/quizzes/Question/?quiz=$quizeid");
    return response.fold((l) => l, (r) => r);
  }
}
