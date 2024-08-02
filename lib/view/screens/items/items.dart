import 'package:e_learningplatform/controller/favorite_controller.dart';
import 'package:e_learningplatform/controller/items_controller.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:e_learningplatform/view/Widget/customappbar.dart';
import 'package:e_learningplatform/view/screens/items/widget/customlistctaegoriesitems.dart';
import 'package:e_learningplatform/view/screens/items/widget/customlistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleappbar: "49".tr,
              onPressedIconFavorite: () {
                controller.goToPageMyFavorite();
              },
              onPressedSearch: () {
                // controller.onSearchItems();
              },
              // myController: controller.search,
              onChanged: (val) {
                // controller.chechSearch(val);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        controllerFav.isFavorite[controller.data[index]
                            ['id']] = controller.data[index]['isFavorite'];
                        return CustomListItems(
                          courseModel:
                              CourseModel.fromJson(controller.data[index]),
                          
                        );
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
