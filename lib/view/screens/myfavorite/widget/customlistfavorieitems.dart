import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learningplatform/controller/myfavorite_controller%20copy.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  const CustomListFavoriteItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.goTOPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "${itemsModel.course!.image}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${itemsModel.course!.title}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rating",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 10,
                      child: Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 17,
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
                    Text(
                      "${itemsModel.course!.price} \$",
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.kPrimaryColor,
                          fontFamily: "sans"),
                    ),
                    IconButton(
                        onPressed: () {
                          controller
                              .deleteFromFavorite(itemsModel.id.toString());
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: AppColor.primaryColor,
                        ))
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
