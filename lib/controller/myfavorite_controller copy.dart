import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/myfavorite.dart';
import 'package:e_learningplatform/data/model/myfavorite.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyServices myServices = Get.find();
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response;
      data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      print("data");
      print(data);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    // ignore: unused_local_variable
    var response = favoriteData.deleteData(favoriteid);
    // ignore: unrelated_type_equality_checks
    data.removeWhere((element) => element.id.toString() == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
// deleteFromFavorite(String favoriteid)  {
//     var response =  favoriteData.deleteData(favoriteid);
//     data.removeWhere((element) => element.favoriteId == favoriteid);
//     update();
//   }