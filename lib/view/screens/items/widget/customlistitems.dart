import 'package:e_learningplatform/controller/favorite_controller.dart';
import 'package:e_learningplatform/controller/items_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final CourseModel courseModel;

  const CustomListItems({
    super.key,
    required this.courseModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTOPageProductDetails(courseModel);
      },
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        "${courseModel.image}",
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${courseModel.title}",
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Rating",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            width: 65,
                          ),
                          Text(
                            "${courseModel.rate}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 10,
                            child: Row(
                              children: [
                                ...List.generate(
                                    1,
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.yellow,
                                        ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(
                          //   "${courseModel.itemsPriceDiscount} \$",
                          //   style: const TextStyle(
                          //       fontSize: 16,
                          //       color: AppColor.primaryColor,
                          //       fontFamily: "sans"),
                          // ),
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                                onPressed: () {
                                  if (controller.isFavorite[courseModel.id] ==
                                      1) {
                                    controller.setFavorite(courseModel.id, 0);
                                    controller.removeFavorite(
                                        courseModel.id.toString());
                                  } else {
                                    controller.setFavorite(courseModel.id, 1);
                                    controller
                                        .addFavorite(courseModel.id.toString());
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorite[courseModel.id] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: AppColor.primaryColor,
                                )),
                          )
                        ],
                      ),
                    ]),
                // if (courseModel.itemsDiscount != 0)
                //   Positioned(
                //     left: 2,
                //     top: 2,
                //     child: Image.asset(
                //       AppImageAsset.sale,
                //       width: 40,
                //       // height: 40,
                //     ),
                //   )
              ],
            )),
      ),
    );
  }
}
