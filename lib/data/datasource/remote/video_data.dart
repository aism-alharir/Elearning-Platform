import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class VideoData {
  Crud crud;
  VideoData(this.crud);

  getData(String courseid) async {
    var response =
        await crud.getData("${AppLink.video}/?course=$courseid");
    return response.fold((l) => l, (r) => r);
  }

  
}
