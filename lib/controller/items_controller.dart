import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/items.dart';
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCategories(int val, String categoriesval);
  getData(String categoriesid);
   goTOPageProductDetails(CourseModel  courseModel);
  goToPageMyFavorite();
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  List categories = [];
  int? selectedCategories;
  String? categoriesid;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    // search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategories = Get.arguments['selectedCategories'];
    categoriesid = Get.arguments['categoriesid'];
    getData(categoriesid!);
  }

  @override
  changeCategories(val, categoriesval) {
    selectedCategories = val;
    categoriesid = categoriesval;
    getData(categoriesid!);
    update();
  }

  @override
  getData(categoriesid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categoriesid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goTOPageProductDetails(courseModel) {
    Get.toNamed(RoutesNames.courseDetails,
        arguments: {"courseModel": courseModel});
    // Get.toNamed(AppRoutes.productDetails,
    //     arguments: {"itemsModel": itemsModel});
  }

  @override
  goToPageMyFavorite() {
    Get.toNamed(RoutesNames.whishlist);
  }

  
}

// @override
//   getData(String categoryId) async {
//     final uri = Uri.parse(
//         'http://192.168.8.101:9000/courses/byCategory/?category=$categoryId');
//         statusRequest = StatusRequest.loading;
//     final response = await http.get(uri);

//     if (response.statusCode == 200) {
//       if (StatusRequest.success == statusRequest) {
//       data.addAll(response as Iterable );
//     } else {
//       statusRequest = StatusRequest.failure;
//     }
//     update();
      
//     } else {
//       throw Exception('Failed to fetch courses: ${response.statusCode}');
//     }
//   }